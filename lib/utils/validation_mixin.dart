mixin ValidationsMixin {
  String? validatedField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field Can not be empty';
    } else {
      return null;
    }
  }
}
