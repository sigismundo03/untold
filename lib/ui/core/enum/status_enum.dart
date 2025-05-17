enum StatusEnum {
  init,
  loading,
  success,
  error;

  bool get isLoading => this == StatusEnum.loading;
  bool get isSuccess => this == StatusEnum.success;
  bool get isError => this == StatusEnum.error;
}
