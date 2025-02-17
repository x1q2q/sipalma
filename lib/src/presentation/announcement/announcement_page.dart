import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sipalma/src/application/announcement/announcements_service.dart';
import 'package:sipalma/src/res/styles/index.dart';
import 'package:sipalma/src/utils/extensions.dart';
import 'list_announcement_widget.dart';

class AnnouncementPage extends ConsumerWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(title: Text('Pengumuman', style: AppTxtStyle.wTitleNav)),
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight),
                      child: const ListAnnouncementWidget().addPd(all: 10)))
              .addRefresher(
                  bgColor: AppColors.green,
                  onRefresh: () async {
                    ref.refresh(fetchAnnouncementsProvider.future);
                  });
        })));
  }
}

// AppSearchbar(
// title: 'pengumuman',
// onSubmit: (value) {
//   ref.refresh(
//       searchAnnouncementProvider(query: value)
//           .future);
// }).addPd(y: 10),