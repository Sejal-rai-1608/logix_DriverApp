import 'dart:io';

enum DocumentStatus {
  pending,
  approved,
  rejected
}

class DriverDocument {
  final String title;
  final String subtitle;
  final IconDataData icon;
  File? file;
  DocumentStatus status;

  DriverDocument({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.file,
    this.status = DocumentStatus.pending,
  });
}

class IconDataData {
  final int code;

  IconDataData(this.code);
}