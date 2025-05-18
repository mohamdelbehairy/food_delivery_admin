class ButtonModel {
  final String? buttonName;
  final bool isLoading;
  final Function()? onTap;

  ButtonModel({this.buttonName, this.isLoading = false, this.onTap});
}
