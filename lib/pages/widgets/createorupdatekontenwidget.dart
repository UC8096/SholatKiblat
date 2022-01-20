part of 'widgets.dart';

class CreateOrUpdateKontenWidget extends StatelessWidget {
  const CreateOrUpdateKontenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KontenController>(
        init: KontenController(),
        builder: (controller) {
          if (Get.arguments?["isUpdate"] == true) {
            controller.argumentimage.value = Get.arguments["image"];
            controller.argumenttitle.value = Get.arguments["title"];
            controller.argumentdesc.value = Get.arguments["desc"];
            controller.argumentdocID.value = Get.arguments["docID"];
            controller.argumentisCreator.value = Get.arguments["isCreator"];

            controller.titleController.text = controller.argumenttitle.value;
            controller.descriptionController.text =
                controller.argumentdesc.value;
          }

          GlobalKey<ScaffoldState>? _scaffoldKey = Get.arguments?["drawerkey"];

          return Scaffold(
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Form(
                    key: controller.addItemFormKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                            bottom: 24.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Title',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              CustomFormField(
                                isLabelEnabled: false,
                                controller: controller.titleController,
                                focusNode: controller.titleFocusNode,
                                keyboardType: TextInputType.text,
                                inputAction: TextInputAction.next,
                                validator: (value) =>
                                    Validator.validateField(value: value),
                                label: 'Title',
                                hint: 'Enter your note title',
                              ),
                              const SizedBox(height: 24.0),
                              const Text(
                                'Description',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              CustomFormField(
                                maxLines: 17,
                                isLabelEnabled: false,
                                controller: controller.descriptionController,
                                focusNode: controller.descriptionFocusNode,
                                keyboardType: TextInputType.multiline,
                                inputAction: TextInputAction.done,
                                validator: (value) =>
                                    Validator.validateField(value: value),
                                label: 'Description',
                                hint: 'Enter your note description',
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () async {
                            controller.getImage();
                          },
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(Icons.image_search_rounded),
                                Text(
                                  "Pick Image",
                                  style: blackBoldPoppins.copyWith(
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Container(
                          height: 250,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: darkgrayColor,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: (controller.image == null &&
                                    Get.arguments?["image"] == null)
                                ? const Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 40,
                                  )
                                : (controller.image == null &&
                                        Get.arguments?["image"] != null)
                                    ? Image.network(Get.arguments?["image"])
                                    : Image.file(controller.image!),
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        Obx(
                          () => controller.isProcessing.value
                              ? const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.orange,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(bottom: 26),
                                  child: SizedBox(
                                    width: Get.width,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        padding: EdgeInsets.zero,
                                      ),
                                      onPressed: () async {
                                        if (Get.arguments?["isUpdate"] ==
                                                false ||
                                            Get.arguments?["isUpdate"] ==
                                                null) {
                                          if (controller
                                              .addItemFormKey.currentState!
                                              .validate()) {
                                            controller.isProcessing.value =
                                                true;

                                            await controller.databaseHelper
                                                .addKonten(
                                              title: controller
                                                  .titleController.text,
                                              description: controller
                                                  .descriptionController.text,
                                              image: controller.image!,
                                              createby:
                                                  controller.user!.displayName!,
                                            );

                                            controller.image = null;
                                            controller.titleController.clear();
                                            controller.descriptionController
                                                .clear();

                                            controller.isProcessing.value =
                                                false;

                                            // Get.arguments?["drawerkey"];
                                            _scaffoldKey?.currentState
                                                ?.openEndDrawer();

                                            Get.back();
                                          }
                                        } else if (Get.arguments?["isUpdate"] ==
                                            true) {
                                          if (controller
                                              .addItemFormKey.currentState!
                                              .validate()) {
                                            controller.isProcessing.value =
                                                true;

                                            if (controller.image == null) {
                                              await controller.databaseHelper
                                                  .updateKonten(
                                                title: controller
                                                    .titleController.text,
                                                description: controller
                                                    .descriptionController.text,
                                                // image: controller.image,
                                                netimage: controller
                                                    .argumentimage.value,
                                                createby: controller
                                                    .user!.displayName!,
                                                docID: controller
                                                    .argumentdocID.value,
                                              );

                                              controller.argumenttitle.value =
                                                  controller
                                                      .titleController.text;
                                              controller.argumentdesc.value =
                                                  controller
                                                      .descriptionController
                                                      .text;

                                              // Get.offAndToNamed("/detail/",
                                              //     arguments: {
                                              //       'image': controller
                                              //           .argumentimage.value,
                                              //       'title': controller
                                              //           .titleController.text,
                                              //       'desc': controller
                                              //           .descriptionController
                                              //           .text,
                                              //       'docID': controller
                                              //           .argumentdocID.value,
                                              //       'isCreator': controller
                                              //           .argumentisCreator
                                              //           .value,
                                              //     });

                                              Get.back();
                                            } else if (controller.image !=
                                                null) {
                                              controller.netimage.value =
                                                  await controller
                                                      .databaseHelper
                                                      .updateImage(
                                                image: controller.image!,
                                                netimage: controller
                                                    .argumentimage.value,
                                              );

                                              await controller.databaseHelper
                                                  .updateKonten(
                                                title: controller
                                                    .titleController.text,
                                                description: controller
                                                    .descriptionController.text,
                                                // image: controller.image,
                                                netimage:
                                                    controller.netimage.value,
                                                createby: controller
                                                    .user!.displayName!,
                                                docID: controller
                                                    .argumentdocID.value,
                                              );

                                              controller.argumenttitle.value =
                                                  controller
                                                      .titleController.text;
                                              controller.argumentdesc.value =
                                                  controller
                                                      .descriptionController
                                                      .text;
                                              controller.argumentimage.value =
                                                  controller.netimage.value;

                                              // Get.offAndToNamed("/detail/",
                                              //     arguments: {
                                              //       'image': controller
                                              //           .netimage.value,
                                              //       'title': controller
                                              //           .titleController.text,
                                              //       'desc': controller
                                              //           .descriptionController
                                              //           .text,
                                              //       'docID':
                                              //           Get.arguments?["docID"],
                                              //       'isCreator': Get
                                              //           .arguments["isCreator"],
                                              //     });

                                              Get.back();
                                            }

                                            // controller.title.value =
                                            //     controller.titleController.text;
                                            // controller.desc.value = controller
                                            //     .descriptionController.text;

                                            controller.image = null;
                                            controller.titleController.clear();
                                            controller.descriptionController
                                                .clear();

                                            controller.isProcessing.value =
                                                false;
                                          }
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 60, vertical: 12),
                                        child: Text(
                                          (Get.arguments?["isUpdate"] == true)
                                              ? "Update Konten"
                                              : "Add Konten",
                                          style: blackBoldPoppins.copyWith(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
                onPressed: () {
                  controller.titleController.clear();
                  controller.descriptionController.clear();
                  controller.image = null;
                  // Get.offAndToNamed("/detail/", arguments: {
                  //   'image': Get.arguments?["image"],
                  //   'title': Get.arguments?["title"],
                  //   'desc': Get.arguments?["desc"],
                  //   'docID': Get.arguments?["docID"],
                  //   'isCreator': Get.arguments["isCreator"],
                  // });
                  Get.back();
                },
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          );
        });
  }
}

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required TextEditingController controller,
    required FocusNode focusNode,
    required TextInputType keyboardType,
    required TextInputAction inputAction,
    required String label,
    required String hint,
    required Function(String value) validator,
    this.isObscure = false,
    this.isCapitalized = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.isLabelEnabled = true,
  })  : _emailController = controller,
        _emailFocusNode = focusNode,
        _keyboardtype = keyboardType,
        _inputAction = inputAction,
        _label = label,
        _hint = hint,
        _validator = validator,
        super(key: key);

  final TextEditingController _emailController;
  final FocusNode _emailFocusNode;
  final TextInputType _keyboardtype;
  final TextInputAction _inputAction;
  final String _label;
  final String _hint;
  final bool isObscure;
  final bool isCapitalized;
  final int minLines;
  final int maxLines;
  final bool isLabelEnabled;
  final Function(String) _validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
      controller: _emailController,
      focusNode: _emailFocusNode,
      keyboardType: _keyboardtype,
      obscureText: isObscure,
      textCapitalization:
          isCapitalized ? TextCapitalization.words : TextCapitalization.none,
      textInputAction: _inputAction,
      cursorColor: blueColor,
      validator: (value) => _validator(value!),
      decoration: InputDecoration(
        labelText: isLabelEnabled ? _label : null,
        labelStyle: TextStyle(color: blueColor),
        hintText: _hint,
        hintStyle: TextStyle(
          color: darkgrayColor,
        ),
        errorStyle: const TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: blueColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: darkgrayColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
      ),
    );
  }
}
