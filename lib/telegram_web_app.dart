library telegram_web_app;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:telegram_web_app/src/bridge/flutter_js_bridge.dart';
import 'package:telegram_web_app/src/flutter/util/data_parser.dart';
import 'package:telegram_web_app/src/js/telegram/src/events/write_access_requested_event_result.dart';
import 'package:telegram_web_app/src/js/telegram/telegram_js_models.dart' as telegram_js_models;
import 'package:telegram_web_app/src/js/telegram_js.dart' as telegram_js;
import 'package:telegram_web_app/telegram_web_app.dart';

export 'src/bridge/color_utils.dart';

part 'src/flutter/events/back_button_clicked_event.dart';
part 'src/flutter/events/clipboard_text_received_event.dart';
part 'src/flutter/events/contact_requested_event.dart';
part 'src/flutter/events/invoice_closed_event.dart';
part 'src/flutter/events/main_button_clicked_event.dart';
part 'src/flutter/events/popup_closed_event.dart';
part 'src/flutter/events/qr_text_received_event.dart';
part 'src/flutter/events/settings_button_clicked_event.dart';
part 'src/flutter/events/telegram_event.dart';
part 'src/flutter/events/theme_changed_event.dart';
part 'src/flutter/events/viewport_changed_event.dart';
part 'src/flutter/events/write_access_requested_event.dart';
part 'src/flutter/mock/mock_theme_params.dart';
part 'src/flutter/models/back_button.dart';
part 'src/flutter/models/chat_types.dart';
part 'src/flutter/models/cloud_storage.dart';
part 'src/flutter/models/haptic_feedback.dart';
part 'src/flutter/models/main_button.dart';
part 'src/flutter/models/main_button_params.dart';
part 'src/flutter/models/popup_button.dart';
part 'src/flutter/models/settings_button.dart';
part 'src/flutter/models/telegram_color_scheme.dart';
part 'src/flutter/models/telegram_init_data.dart';
part 'src/flutter/models/theme_params.dart';
part 'src/flutter/models/web_app_chat.dart';
part 'src/flutter/models/web_app_init_data.dart';
part 'src/flutter/models/web_app_user.dart';
part 'src/flutter/util/theme_util.dart';
part 'src/telegram_app.dart';
part 'src/web_apps/telegram_web_app_fake.dart';
part 'src/web_apps/telegram_web_app_impl.dart';
