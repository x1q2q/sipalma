import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sipalma/src/res/widgets/index.dart';
import 'package:sipalma/src/routing/app_router.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/assets.dart';
import 'package:sipalma/src/utils/extensions.dart';
import 'package:sipalma/src/domain/billing/billing.dart';
import 'package:sipalma/src/application/billing/billings_service.dart';
import 'billing_controller.dart';

enum MenuPopup { firstItem, secondItem }

class ListBillingWidget extends ConsumerStatefulWidget {
  const ListBillingWidget({super.key});

  @override
  ConsumerState<ListBillingWidget> createState() => _ListBillingWidgetState();
}

class _ListBillingWidgetState extends ConsumerState<ListBillingWidget> {
  final ImagePicker _picker = ImagePicker();
  Future<bool?> openSheet(BuildContext context, List<Widget> colWidget) async {
    return UIHelper.modalSheet(
        context: context,
        child: AppBottomsheet(
          colWidget: colWidget,
        ));
  }

  Future<File?> getImage(String tipe) async {
    XFile? image;
    File? filePhoto;
    ImageSource media =
        tipe == 'camera' ? ImageSource.camera : ImageSource.gallery;
    final pickedFile = await _picker.pickImage(source: media);
    if (pickedFile != null) {
      image = pickedFile;
      filePhoto = File(image.path);
      return filePhoto;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final billingAsyncValue = ref.watch(fetchBillingsProvider);

    return AsyncValueWidget<List<Billing>>(
        value: billingAsyncValue,
        data: (data) => data.isEmpty
            ? AppEmptyBox(onRefresh: () async {
                ref.refresh(fetchBillingsProvider.future);
              })
            : ListView.separated(
                itemCount: data.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) =>
                    AppStyle.yGapSm,
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (BuildContext context, int index) {
                  Billing item = data[index];
                  List<Widget> detailContent = [
                    headBottomSheet(item),
                    bodyDetail(context, item)
                  ];
                  List<Widget> uploadContent = [
                    headBottomSheet(item),
                    bodyMedia(context, item)
                  ];
                  return CardTile(
                    height: 95,
                    widget: contentTile(context, item,
                        colWidget1: detailContent, colWidget2: uploadContent),
                    onTap: () async {
                      await openSheet(context, detailContent);
                    },
                  );
                }));
  }

  Widget headspan(String teks) {
    return Text(teks, style: AppTxtStyle.bBold(14))
        .addPd(y: 4, x: 8)
        .addInkWell(color: AppColors.lightgreen)
        .addBdRadius(20);
  }

  Widget headBottomSheet(Billing item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        headspan('Tagihan ${item.title}'),
        headspan(
          '${item.totalAmount.toString().toRupiah()}',
        )
      ],
    ).addPd(y: 15);
  }

  Widget bodyDetail(BuildContext context, Billing item) {
    List<Widget> colWidget = [headBottomSheet(item), bodyMedia(context, item)];
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '''Silahkan upload bukti transaksi ke nomor rekening berikut:\n
- BRI (628 003343242) a.n Gilga Scream
- BCA (628 003343242) a.n Gilga Scream
- BNI (628 003343242) a.n Gilga Scream
- Mandiri (628 003343242) a.n Gilga Scream''',
            style: AppTxtStyle.bLight(16),
          ),
          AppStyle.yGapSm,
          Center(
              child: ElevatedButton(
                  onPressed: () async {
                    context.pop();
                    await openSheet(context, colWidget);
                  },
                  style: AppBtnStyle.outlineGreenSm,
                  child: Text('Pilih Media', style: AppTxtStyle.gLight(18))))
        ]);
  }

  Widget inkButton(List<Widget> colWidget, void Function() onPress) {
    return Expanded(
        child: SizedBox.fromSize(
                child: Container(
                        height: 120,
                        width: 120,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: colWidget))
                    .addInkWell(
                        color: Colors.white,
                        splash: AppColors.lightgreen,
                        onPress: onPress))
            .addBdRadius(18));
  }

  Widget bodyMedia(BuildContext context, Billing item) {
    final updateState = ref.watch(billingControllerProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Jika sudah transfer, upload bukti transfer di sini:',
            style: AppTxtStyle.bLight(16)),
        AppStyle.yGapSm,
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              inkButton([
                SvgPicture.asset(Assets.galleryAdd),
                Text('Galeri', style: AppTxtStyle.gBold(18))
              ], () async {
                await getImage('galeri').then((value) {
                  context.pop();
                  if (value != null) {
                    List<Widget> uploadContent = [
                      headBottomSheet(item),
                      bodyUpload(context, item, value, updateState)
                    ];
                    openSheet(context, uploadContent);
                  } else {
                    UIHelper.rawToast(context, 'tidak ada gambar terpilih');
                  }
                });
              }),
              inkButton([
                SvgPicture.asset(Assets.cameraAdd),
                Text('kamera', style: AppTxtStyle.gBold(18))
              ], () async {
                await getImage('camera').then((value) {
                  context.pop();
                  if (value != null) {
                    List<Widget> uploadContent = [
                      headBottomSheet(item),
                      bodyUpload(context, item, value, updateState)
                    ];
                    openSheet(context, uploadContent);
                  } else {
                    UIHelper.rawToast(context, 'tidak ada gambar terpilih');
                  }
                });
              })
            ]).addBorder(color: AppColors.primary, radius: 18)
      ],
    );
  }

  Widget bodyUpload(BuildContext context, Billing item, File? filePhoto,
      AsyncValue updateState) {
    Map<String, dynamic> data = {
      'id_tagihan': item.id,
      'nominal': item.totalAmount
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.file(filePhoto!)
            .addBdRadius(18)
            .addBorder(color: AppColors.primary, radius: 18),
        AppStyle.yGapSm,
        Center(
            child: PrimaryButton(
          icon: Text('Upload Gambar', style: AppTxtStyle.wRegular(18)),
          label: SvgPicture.asset(Assets.upload),
          isLoading: updateState.isLoading,
          btnStyle: AppBtnStyle.elevGreenSm,
          onPressed: updateState.isLoading
              ? null
              : () => ref
                      .read(billingControllerProvider.notifier)
                      .uploadImage(data: data, filePhoto: filePhoto)
                      .then((stateError) {
                    context.pop();
                    if (stateError) {
                      String errorObj = (updateState.error != null)
                          ? updateState.error.toString()
                          : 'Server internal error';
                      UIHelper.notifToast(context, errorObj, AppColors.red);
                    } else {
                      context.goNamed(AppRoutes.home.name);
                      UIHelper.notifToast(
                          context,
                          'Berhasil mengupload bukti pembayaran',
                          AppColors.green);
                    }
                  }),
        ))
      ],
    );
  }

  Widget contentTile(BuildContext context, Billing item,
      {required List<Widget> colWidget1, required List<Widget> colWidget2}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              width: 80,
              height: 95,
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.green),
                  borderRadius: BorderRadius.circular(18)),
              child: SvgPicture.asset(Assets.billSvg)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Tagihan ${item.title}',
                overflow: TextOverflow.ellipsis,
                style: AppTxtStyle.bBold(16),
              ),
              Text(
                'Sebesar ${item.totalAmount.toString().toRupiah()}',
                overflow: TextOverflow.ellipsis,
                style: AppTxtStyle.bLight(13),
              ),
              Text(
                'Jatuh pada ${item.createdAt.toFormattedDate('dd MMMM yyyy')}',
                overflow: TextOverflow.ellipsis,
                style: AppTxtStyle.bLight(13),
              ),
            ],
          )),
          PopupMenuButton<MenuPopup>(
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.lightgray),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              color: Colors.white,
              icon: const Icon(
                Icons.more_vert,
                color: AppColors.primary,
                size: 40,
              ),
              onSelected: (MenuPopup item) async {
                switch (item.name) {
                  case 'secondItem':
                    await openSheet(context, colWidget2);
                  default:
                    await openSheet(context, colWidget1);
                }
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<MenuPopup>>[
                    PopupMenuItem<MenuPopup>(
                      value: MenuPopup.firstItem,
                      child:
                          Text('Detail Tagihan', style: AppTxtStyle.bLight(15)),
                    ),
                    PopupMenuItem<MenuPopup>(
                      value: MenuPopup.secondItem,
                      child: Text('Upload Bukti Transaksi',
                          style: AppTxtStyle.bLight(15)),
                    ),
                  ]),
        ]);
  }
}
