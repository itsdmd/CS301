import 'package:collection/collection.dart';

enum Status {
  Checked,
  Unchecked,
  CheckedArchived,
  UncheckedArchived,
}

enum UserTier {
  Basic,
  Pro,
}

enum Language {
  EN,
  VN,
}

enum TaskUrgency {
  P1,
  P2,
  P3,
  P4,
  P5,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Status):
      return Status.values.deserialize(value) as T?;
    case (UserTier):
      return UserTier.values.deserialize(value) as T?;
    case (Language):
      return Language.values.deserialize(value) as T?;
    case (TaskUrgency):
      return TaskUrgency.values.deserialize(value) as T?;
    default:
      return null;
  }
}
