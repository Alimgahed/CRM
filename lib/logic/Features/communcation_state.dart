abstract class CommunicationState {}

class CommunicationInitial extends CommunicationState {}

class CommunicationLoading extends CommunicationState {}

class CommunicationSuccess extends CommunicationState {}

class CommunicationError extends CommunicationState {
  final String message;
  CommunicationError(this.message);
}
