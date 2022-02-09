class ProjectDetails {
  final String projectName;
  final DateTime createdDate;
  final DateTime lastHeartBeat;
  final String id;

  const ProjectDetails({
    required this.projectName,
    required this.createdDate,
    required this.lastHeartBeat,
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectDetails &&
          runtimeType == other.runtimeType &&
          projectName == other.projectName &&
          createdDate == other.createdDate &&
          lastHeartBeat == other.lastHeartBeat &&
          id == other.id;

  @override
  int get hashCode =>
      projectName.hashCode ^ createdDate.hashCode ^ lastHeartBeat.hashCode ^ id.hashCode;
}
