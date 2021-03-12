import 'package:catcher/handlers/console_handler.dart';
import 'package:catcher/mode/dialog_report_mode.dart';
import 'package:catcher/mode/silent_report_mode.dart';
import 'package:catcher/model/localization_options.dart';
import 'package:catcher/model/report_handler.dart';
import 'package:catcher/model/report_mode.dart';

typedef CustomParameterFn = Map<String, dynamic> Function();

Map<String, dynamic> defaultCustFn() {
  return Map();
}

class CatcherOptions {
  /// Handlers that should be used
  final List<ReportHandler> handlers;

  /// Timeout for handlers which uses long-running action. In milliseconds.
  final int handlerTimeout;

  /// Report mode that should be called if new report appears
  final ReportMode reportMode;

  /// Localization options (translations)
  final List<LocalizationOptions> localizationOptions;

  /// Explicit report modes map which will be used to trigger specific report mode
  /// for specific error
  final Map<String, ReportMode> explicitExceptionReportModesMap;

  /// Explicit report handler map which will be used to trigger specific report
  /// report handler for specific error
  final Map<String, ReportHandler> explicitExceptionHandlersMap;

  /// Custom parameters which will be used in report handler
  final CustomParameterFn customParameters;

  ///Should catcher handle silent errors
  final bool handleSilentError;

  /// Builds catcher options instance
  CatcherOptions(
    this.reportMode,
    this.handlers, {
    this.handlerTimeout = 5000,
    this.customParameters = defaultCustFn,
    this.localizationOptions = const [],
    this.explicitExceptionReportModesMap = const {},
    this.explicitExceptionHandlersMap = const {},
    this.handleSilentError = true,
  });

  /// Builds default catcher options release instance
  CatcherOptions.getDefaultReleaseOptions()
      : handlers = [ConsoleHandler()],
        reportMode = DialogReportMode(),
        handlerTimeout = 5000,
        customParameters = defaultCustFn,
        localizationOptions = [],
        explicitExceptionReportModesMap = {},
        explicitExceptionHandlersMap = {},
        handleSilentError = true;

  /// Builds default catcher options rdebug instance
  CatcherOptions.getDefaultDebugOptions()
      : handlers = [ConsoleHandler()],
        reportMode = SilentReportMode(),
        handlerTimeout = 10000,
        customParameters = defaultCustFn,
        localizationOptions = [],
        explicitExceptionReportModesMap = {},
        explicitExceptionHandlersMap = {},
        handleSilentError = true;

  /// Builds default catcher options profile instance
  CatcherOptions.getDefaultProfileOptions()
      : handlers = [ConsoleHandler()],
        reportMode = SilentReportMode(),
        handlerTimeout = 10000,
        customParameters = defaultCustFn,
        localizationOptions = [],
        explicitExceptionReportModesMap = {},
        explicitExceptionHandlersMap = {},
        handleSilentError = true;
}
