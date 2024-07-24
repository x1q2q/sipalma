import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sipalma/src/res/widgets/index.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/res/assets.dart';
import 'package:sipalma/src/utils/extensions.dart';

class ListAnnouncementWidget extends StatelessWidget {
  const ListAnnouncementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> bottomSheetContent = [headBottomSheet(), bodyBottomSheet()];
    return ListView.separated(
        itemCount: 20,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => AppStyle.yGapSm,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (BuildContext context, int index) {
          return CardTile(
            height: 95,
            widget: contentTile(),
            onTap: () async {
              await UIHelper.modalSheet(
                  context: context,
                  child: AppBottomsheet(
                    colWidget: bottomSheetContent,
                  ));
            },
          );
        });
  }

  Widget headspan(String teks) {
    return Text(teks, style: AppTxtStyle.bBold(14))
        .addPd(y: 4, x: 8)
        .addInkWell(color: AppColors.lightgreen)
        .addBdRadius(20);
  }

  Widget headBottomSheet() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        headspan('12 Juni 2024, 15:00'),
        headspan('Oleh Admin')
      ],
    ).addPd(y: 15);
  }

  Widget bodyBottomSheet() {
    return Text(
      'lorem ipsum dolor site amet color bilbla-bla-lba-hoec terus lorem ipsum dolor site amet color bilbla-bla-lba-hoec terus lorem ipsum dolor site amet color bilbla-bla-lba-hoec terus lorem ipsum dolor site amet color bilbla-bla-lba-hoec terus lorem ipsum dolor site amet color bilbla-bla-lba-hoec terus ',
      textAlign: TextAlign.justify,
      style: AppTxtStyle.bLight(17),
    );
  }

  Widget contentTile() {
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
                'lorem ipsum dolor sit amet consectiur bla-bla-bla-blac lorem ipsum dolor sit amet consectiur bla-bla-bla-blac lorem ipsum dolor sit amet consectiur bla-bla-bla-blac ',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTxtStyle.bLight(16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'oleh Admin',
                    style: AppTxtStyle.bBold(13),
                  ),
                  Text(
                    '12 Juni 2024, 15:00',
                    style: AppTxtStyle.bBold(13),
                  ),
                ],
              )
            ],
          ).addPd(x: 10))
        ]);
  }
}
