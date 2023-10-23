import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizeExtension on num {
  double get wf => min(this * 1.08, w);

  double get hf => min(this * 1.08, h);

  double get rf => min(this * 1.08, r);
}
