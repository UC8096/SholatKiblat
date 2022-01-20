part of 'widgets.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KontenController>(builder: (controller) {
      controller.argumentimage.value = Get.arguments["image"];
      controller.argumenttitle.value = Get.arguments["title"];
      controller.argumentdesc.value = Get.arguments["desc"];
      controller.argumentdocID.value = Get.arguments["docID"];
      controller.argumentisCreator.value = Get.arguments["isCreator"];

      return Scaffold(
        body: Obx(
          () => (controller.isProcessing.value == true)
              ? const Center(child: LoadWidget())
              : CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    (Get.arguments == null)
                        ? SliverAppBar(
                            automaticallyImplyLeading: false,
                            // floating: true,
                            // pinned: true,
                            // snap: true,
                            stretch: true,
                            expandedHeight: Get.height / 2,
                            flexibleSpace: FlexibleSpaceBar(
                              background: Image.network(
                                (Get.arguments == null)
                                    ? "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png"
                                    : controller.argumentimage.value,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : (controller.argumentisCreator.value == true)
                            ? SliverAppBar(
                                automaticallyImplyLeading: false,
                                // floating: true,
                                // pinned: true,
                                // snap: true,
                                stretch: true,
                                backgroundColor: blueColor,
                                expandedHeight: Get.height / 2,
                                flexibleSpace: FlexibleSpaceBar(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () => Get.toNamed(
                                            "/createOrUpdate/",
                                            arguments: {
                                              "isUpdate": true,
                                              "title": controller
                                                  .argumenttitle.value,
                                              "desc":
                                                  controller.argumentdesc.value,
                                              "image": controller
                                                  .argumentimage.value,
                                              "docID": controller
                                                  .argumentdocID.value,
                                              "isCreator": controller
                                                  .argumentisCreator.value,
                                            }),
                                        child: Container(
                                          height: 35.0,
                                          width: 35.0,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 2),
                                                blurRadius: 6.0,
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: Icon(
                                              Icons.edit_rounded,
                                              color: blueColor,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          controller.isProcessing.value = true;

                                          await controller.databaseHelper
                                              .deleteItem(
                                            docID:
                                                controller.argumentdocID.value,
                                            netimage:
                                                controller.argumentimage.value,
                                          );

                                          controller.isProcessing.value = false;

                                          Get.back();
                                        },
                                        child: Container(
                                          height: 35.0,
                                          width: 35.0,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 2),
                                                blurRadius: 6.0,
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: Icon(
                                              Icons.delete_rounded,
                                              color: blueColor,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  background: Image.network(
                                    (Get.arguments == null)
                                        ? "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png"
                                        : controller.argumentimage.value,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : SliverAppBar(
                                automaticallyImplyLeading: false,
                                // floating: true,
                                // pinned: true,
                                // snap: true,
                                stretch: true,
                                expandedHeight: Get.height / 2,
                                flexibleSpace: FlexibleSpaceBar(
                                  background: Image.network(
                                    (Get.arguments == null)
                                        ? "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png"
                                        : controller.argumentimage.value,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          (Get.arguments == null)
                              ? SizedBox(
                                  height: Get.height / 2 + 100,
                                  width: Get.width,
                                  child: Center(
                                    child: Text(
                                      "Kosong",
                                      style: darkgreyBoldPoppins.copyWith(
                                          fontSize: 22),
                                    ),
                                  ))
                              : (Get.arguments["isCreator"] == true)
                                  ? SizedBox(
                                      width: Get.width,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30),
                                            child: Text(
                                                controller.argumenttitle.value,
                                                style: blackBoldPoppins
                                                    .copyWith(fontSize: 35)),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30),
                                            child: Text(
                                              controller.argumentdesc.value,
                                              style: poppins.copyWith(
                                                  fontSize: 14),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(
                                      width: Get.width,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30),
                                            child: Text(
                                                controller.argumenttitle.value,
                                                style: blackBoldPoppins
                                                    .copyWith(fontSize: 35)),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30),
                                            child: Text(
                                              controller.argumentdesc.value,
                                              style: poppins.copyWith(
                                                  fontSize: 14),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 20.0),
          child: FloatingActionButton(
            backgroundColor: grayColor,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 27,
                  color: blueColor,
                ),
              ),
              decoration: const BoxDecoration(shape: BoxShape.circle),
            ),
            onPressed: () => Get.back(),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      );
    });
  }
}
