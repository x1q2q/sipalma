import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sipalma/src/res/widgets/index.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/assets.dart';
import 'package:sipalma/src/utils/extensions.dart';
import 'package:sipalma/src/domain/announcement/announcement.dart';
import 'package:sipalma/src/application/announcement/announcements_service.dart';

class ListAnnouncementWidget extends ConsumerWidget {
  const ListAnnouncementWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final announcementAsyncValue = ref.watch(fetchAnnouncementsProvider);
    return AsyncValueWidget<List<Announcement>>(
        value: announcementAsyncValue,
        data: (data) => ListView.separated(
            itemCount: data.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) =>
                AppStyle.yGapSm,
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (BuildContext context, int index) {
              Announcement item = data[index];
              List<Widget> bottomSheetContent = [
                headBottomSheet(item),
                bodyBottomSheet(item)
              ];
              return CardTile(
                height: 95,
                widget: contentTile(item),
                onTap: () async {
                  await UIHelper.modalSheet(
                      context: context,
                      child: AppBottomsheet(
                        colWidget: bottomSheetContent,
                      ));
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

  Widget headBottomSheet(Announcement item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        headspan('${item.createdAt}'.toFormattedDate('dd MMMM yyyy')),
        headspan('Oleh ${item.createdBy}')
      ],
    ).addPd(y: 15);
  }

  Widget bodyBottomSheet(Announcement item) {
    return Text(
      '${item.content}',
      textAlign: TextAlign.justify,
      style: AppTxtStyle.bLight(17),
    );
  }

  Widget contentTile(Announcement item) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              width: 80,
              height: 95,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.green),
                  borderRadius: BorderRadius.circular(18)),
              child: SvgPicture.asset(Assets.announcementSvg)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                item.content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTxtStyle.bLight(16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'oleh ${item.createdBy}',
                    style: AppTxtStyle.bBold(13),
                  ),
                  Text(
                    '${item.createdAt}'.toFormattedDate('dd MMMM yyyy'),
                    style: AppTxtStyle.bBold(13),
                  ),
                ],
              )
            ],
          ).addPd(x: 10))
        ]);
  }
}
