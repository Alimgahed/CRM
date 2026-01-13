import 'package:crm/logic/Features/communcation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunicationCubit extends Cubit<CommunicationState> {
  CommunicationCubit() : super(CommunicationInitial());

  /// Launch WhatsApp with a message
  Future<void> whatsapp({required String phone, String message = 'Hi,'}) async {
    emit(CommunicationLoading());
    final String url = 'whatsapp://send?phone=$phone&text=$message';

    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        emit(CommunicationSuccess());
      } else {
        emit(CommunicationError('WhatsApp is not installed.'));
      }
    } catch (e) {
      emit(CommunicationError('Failed to open WhatsApp.'));
    }
  }

  /// Make a phone call
  Future<void> makePhoneCall(String phoneNumber) async {
    emit(CommunicationLoading());
    final Uri url = Uri.parse('tel:$phoneNumber');

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
        emit(CommunicationSuccess());
      } else {
        emit(CommunicationError('Could not launch phone call.'));
      }
    } catch (e) {
      emit(CommunicationError('Failed to make phone call.'));
    }
  }
}
