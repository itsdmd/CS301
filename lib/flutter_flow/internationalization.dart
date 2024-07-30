import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'vi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? viText = '',
  }) =>
      [enText, viText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Authentication
  {
    'hqrhsyt1': {
      'en': 'To-do App',
      'vi': 'To-do App',
    },
    '5kve33mf': {
      'en': 'Sign In',
      'vi': 'Đăng nhập',
    },
    'o7nd14gb': {
      'en': 'Email',
      'vi': 'Email',
    },
    '4dsdxis9': {
      'en': 'Password',
      'vi': 'Mật khẩu',
    },
    'lx7nffjt': {
      'en': 'Sign In',
      'vi': 'Đăng nhập',
    },
    'jngasi34': {
      'en': 'Forgot Password',
      'vi': 'Quên mật khẩu',
    },
    'e07ulp7n': {
      'en': 'Or sign in with',
      'vi': 'Hoặc đăng nhập bằng',
    },
    'nsuike93': {
      'en': 'Continue with Google',
      'vi': 'Đăng nhập bằng Google',
    },
    'hyxgpyi8': {
      'en': 'Sign Up',
      'vi': 'Đăng ký',
    },
    'q6dbay3n': {
      'en': 'Email',
      'vi': 'Email',
    },
    'ywrfbb6w': {
      'en': 'Password',
      'vi': 'Mật khẩu',
    },
    'xb3dxrqp': {
      'en': 'Confirm Password',
      'vi': 'Xác nhận mật khẩu',
    },
    '17wwjjiu': {
      'en': 'Display Name',
      'vi': 'Tên hiển thị',
    },
    't16g0t4j': {
      'en': 'Create Account',
      'vi': 'Tạo tài khoản',
    },
    '10f2p1ur': {
      'en': 'Or sign up with',
      'vi': 'Hoặc đăng ký bằng',
    },
    'pid4gd4m': {
      'en': 'Continue with Google',
      'vi': 'Đăng ký bằng Google',
    },
    'cxfvfn0x': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // NewTask
  {
    'ftvh4a0o': {
      'en': 'Upload',
      'vi': 'Tải lên',
    },
    'w4sppwy7': {
      'en': 'Title...',
      'vi': 'Tiêu đề...',
    },
    't9rdrol5': {
      'en': 'Description...',
      'vi': 'Mô tả...',
    },
    'l8cv5sk8': {
      'en': 'Due Time',
      'vi': 'Thời hạn',
    },
    '5mfgd3fj': {
      'en': 'Tags',
      'vi': 'Thẻ',
    },
    'cwl2nq7d': {
      'en': 'Tag',
      'vi': 'Thẻ',
    },
    'l9r57mid': {
      'en': 'Priority',
      'vi': 'Ưu tiên',
    },
    'fiujgvm7': {
      'en': 'Option 1',
      'vi': 'Lựa chọn 1',
    },
    '0917lvdu': {
      'en': 'Select priority level...',
      'vi': 'Chọn mức ưu tiên...',
    },
    'aq4kahfu': {
      'en': 'Search for an item...',
      'vi': 'Tìm...',
    },
    '5r7zydi1': {
      'en': 'Sync with Google Calendar',
      'vi': 'Đồng bộ vói Google Calendar',
    },
    'oe30y6oi': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // NewTag
  {
    'g21ocvpx': {
      'en': 'Name',
      'vi': 'Tên thẻ',
    },
    '8z95fxy2': {
      'en': 'Select a color...',
      'vi': 'Chọn màu...',
    },
    'tc4gnen2': {
      'en': 'Create Tag',
      'vi': 'Tạo thẻ',
    },
    'yuh8e4e6': {
      'en': 'Create Tag',
      'vi': 'Tạo thẻ',
    },
    'i9nsz7g6': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // All
  {
    'q2fs86fk': {
      'en': 'All',
      'vi': 'Tất cả',
    },
    'zr2zd6nu': {
      'en': 'Search task...',
      'vi': 'Tìm tác vụ...',
    },
    '596sjgd6': {
      'en': 'Filters',
      'vi': 'Lọc',
    },
    'm7mik9zl': {
      'en': 'Sort',
      'vi': 'Sắp xếp',
    },
    'cd0x1qxe': {
      'en': 'Tags',
      'vi': 'Thẻ',
    },
    'n0bn4ksj': {
      'en': 'Due time',
      'vi': 'Thời hạn',
    },
    '80ra090l': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // EditTask
  {
    'lx38hwjk': {
      'en': 'Upload',
      'vi': 'Tải lên',
    },
    '7bo1eepi': {
      'en': 'Title...',
      'vi': 'Tiêu đề...',
    },
    'ykn8cges': {
      'en': 'Description...',
      'vi': 'Mô tả...',
    },
    'dwyyaj1h': {
      'en': 'Due Date',
      'vi': 'Thời hạn',
    },
    'w855vhw6': {
      'en': 'Subtasks',
      'vi': 'Tác vụ con',
    },
    'i7g0j91j': {
      'en': 'Subtask',
      'vi': 'Tác vụ con',
    },
    '4jcqsk91': {
      'en': 'Tags',
      'vi': 'Thẻ',
    },
    'vk49hpkk': {
      'en': 'Tag',
      'vi': 'Thẻ',
    },
    '9xgcgasc': {
      'en': 'Priority',
      'vi': 'Ưu tiên',
    },
    '30qxr7bx': {
      'en': 'Option 1',
      'vi': 'Lựa chọn 1',
    },
    's56yycsl': {
      'en': 'Select priority level...',
      'vi': 'Chọn mức ưu tiên...',
    },
    's7k86y67': {
      'en': 'Search for an item...',
      'vi': 'Tìm...',
    },
    'bziq37vy': {
      'en': 'Sync with Google Calendar',
      'vi': 'Đồng bộ vói Google Calendar',
    },
    'uld79s18': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // EditTag
  {
    'gokgrfge': {
      'en': 'Name',
      'vi': 'Tên thẻ',
    },
    'uowger8t': {
      'en': 'Select a color...',
      'vi': 'Chọn màu...',
    },
    '2y0mttah': {
      'en': 'Update Tag',
      'vi': 'Cập nhật thẻ',
    },
    'o4ktkunr': {
      'en': 'Edit Tag',
      'vi': 'Chỉnh sửa thẻ',
    },
    'w9dyr4ob': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // Today
  {
    'frui3w20': {
      'en': 'Today',
      'vi': 'Hôm nay',
    },
    'dtulxi5s': {
      'en': 'Search task...',
      'vi': 'Tìm tác vụ...',
    },
    '594xpo5r': {
      'en': 'Filters',
      'vi': 'Lọc',
    },
    'rjwzddqi': {
      'en': 'Sort',
      'vi': 'Sắp xếp',
    },
    'bwg9ltft': {
      'en': 'Tags',
      'vi': 'Thẻ',
    },
    '0ski73eh': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // Settings
  {
    'nhswkqjh': {
      'en': 'Dark Mode',
      'vi': 'Chế độ ban đêm',
    },
    'j7yq0k9d': {
      'en': 'Language',
      'vi': 'Ngôn ngữ (Language)',
    },
    '3u4cadka': {
      'en': 'Change Password',
      'vi': 'Đổi mật khẩu',
    },
    'utfpk01j': {
      'en': 'Sync with Google Calendar',
      'vi': 'Đồng bộ với Google Calendar',
    },
    '2r79wg1j': {
      'en': 'Delete Account',
      'vi': 'Xóa tài khoản',
    },
    '8xis03m2': {
      'en': 'Log Out',
      'vi': 'Đăng xuất',
    },
    '96qss55g': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // EditDisplayName
  {
    'odbui4zs': {
      'en': 'Display Name',
      'vi': 'Tên hiển thị',
    },
    'plu7gn0q': {
      'en':
          'Please make sure that your display name:\n • Contains only alphabetic characters (A-Z, a-z)\n • Has length equal to or less than 15',
      'vi':
          'Đảm bảo rằng tên hiển thị của ban:\n • Chỉ bao gồm các kí tự La Mã, không dấu (A-Z, a-z)\n • Có chiều dài tối đa 15 kí tự',
    },
    'jp072w26': {
      'en': 'Update',
      'vi': 'Cập nhật',
    },
    'bsoyke49': {
      'en': 'Cancel',
      'vi': 'Hủy',
    },
    'iall8l6y': {
      'en': 'Edit Display Name',
      'vi': 'Chỉnh sửa tên hiển thị',
    },
    'tohp5jgz': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // ChangePassword
  {
    'f14aenhr': {
      'en': 'Current Password',
      'vi': 'Mật khẩu hiện tại',
    },
    '8ccj4ea7': {
      'en': 'New Password',
      'vi': 'Mật khẩu mới',
    },
    'd5djqa9l': {
      'en': 'Confirm New Password',
      'vi': 'Xác nhận mật khẩu mới',
    },
    '978h595a': {
      'en': 'Password confirmation does not match',
      'vi': 'Mật khẩu xác nhận không trùng khớp',
    },
    'jcjj9zdv': {
      'en': 'New password must be different\nfrom current password',
      'vi': 'Mật khẩu mới phải khác mật khẩu hiện tại',
    },
    'weymf6gj': {
      'en': 'Failed to change your password. Please try again.',
      'vi': 'Thay đổi mật khẩu thất bại. Vui lòng thử lại.',
    },
    'p0fb9bp7': {
      'en': 'Update',
      'vi': 'Cập nhật',
    },
    '6kz7cbsl': {
      'en': 'Cancel',
      'vi': 'Hủy',
    },
    '8k38i0c2': {
      'en': 'Field is required',
      'vi': 'Đây là trường bắt buộc',
    },
    '39gycc0q': {
      'en': 'Password is too long',
      'vi': 'Mật khẩu quá dài',
    },
    'x9zi95gx': {
      'en': 'Please choose an option from the dropdown',
      'vi': 'Vui lòng chọn một mục trong menu',
    },
    '5anco60e': {
      'en': 'Field is required',
      'vi': 'Đây là trường bắt buộc',
    },
    '1brd7ukk': {
      'en': 'Password must contains 6 or more characters',
      'vi': 'Mật khẩu phải chứa ít nhất 6 kí tự',
    },
    'hnfb4mtx': {
      'en': 'Password is too long',
      'vi': 'Mật khẩu quá dài',
    },
    'w1um7i5a': {
      'en': 'Please choose an option from the dropdown',
      'vi': 'Vui lòng chọn một mục trong menu',
    },
    'weyll860': {
      'en': 'Field is required',
      'vi': 'Đây là trường bắt buộc',
    },
    'oewg2j9z': {
      'en': 'Password must contains 6 or more characters',
      'vi': 'Mật khẩu phải chứa ít nhất 6 kí tự',
    },
    'z46v3bwx': {
      'en': 'Password is too long',
      'vi': 'Mật khẩu quá dài',
    },
    '77s0k9xl': {
      'en': 'Please choose an option from the dropdown',
      'vi': 'Vui lòng chọn một mục trong menu',
    },
    '56a0crpp': {
      'en': 'Change Password',
      'vi': 'Cập nhật mật khẩu',
    },
    'rv6lc2bn': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // TaskOptions
  {
    'z5lve0aj': {
      'en': 'Options',
      'vi': 'Hành động',
    },
    '2hhdjeft': {
      'en': 'Edit',
      'vi': 'Chỉnh sửa',
    },
    'id3599ug': {
      'en': 'Delete',
      'vi': 'Xóa',
    },
  },
  // TaskDeleteConfirmation
  {
    'e43pnj4q': {
      'en': 'Confirm task deletion?',
      'vi': 'Xác nhận thao tác xóa tác vụ?',
    },
    '87guvq3i': {
      'en': 'Delete',
      'vi': 'Xóa',
    },
    'r6wa6dsa': {
      'en': 'Cancel',
      'vi': 'Hủy',
    },
  },
  // TaskFilterOptions
  {
    'k2b535o0': {
      'en': 'Filter tasks',
      'vi': 'Lọc tác vụ',
    },
    'gxwi2y23': {
      'en': 'Tags',
      'vi': 'Thẻ',
    },
    'vfweiv2l': {
      'en': 'Cancel',
      'vi': 'Hủy',
    },
  },
  // ProfilePicOptions
  {
    'ntxxhv1m': {
      'en': 'Options',
      'vi': 'Hành động',
    },
    '1wn2mz4b': {
      'en': 'Edit',
      'vi': 'Cập nhật',
    },
    '5p12q0u4': {
      'en': 'Delete',
      'vi': 'Xóa',
    },
  },
  // AccountDeleteConfirmation
  {
    'tx9zcejq': {
      'en':
          'Are you sure you want to delete your To-do app account?\n\nThis action CANNOT be undone!',
      'vi':
          'Bạn có chắc chắn muốn xóa tài khoản To-do App của mình?\n\nHành động này KHÔNG THỂ hoàn tác!',
    },
    '8hqx2jz5': {
      'en': 'Delete',
      'vi': 'Xóa',
    },
    'jm6vwb7x': {
      'en': 'Cancel',
      'vi': 'Hủy',
    },
  },
  // LanguageSelector
  {
    '3u6ze756': {
      'en': '🇻🇳',
      'vi': '🇻🇳',
    },
    'mjkac2f5': {
      'en': 'Tiếng Việt',
      'vi': 'Tiếng Việt',
    },
    '7vljhosb': {
      'en': '🇬🇧',
      'vi': '🇬🇧',
    },
    'x7yrrsm4': {
      'en': 'English',
      'vi': 'English',
    },
    'sy3e92l5': {
      'en': 'Cancel',
      'vi': 'Hủy',
    },
  },
  // Miscellaneous
  {
    'eocixmi7': {
      'en':
          'Optional - In order to take photos or videos directly in this app, permission to access your Camera is required.',
      'vi': '',
    },
    'ajfavun0': {
      'en':
          'Optional - In order to upload photos to tasks you created in this app, permission to access your Photo Library is required.',
      'vi': '',
    },
    '701li2gr': {
      'en':
          'Photo Library permission allows you to attach photos to your tasks.',
      'vi':
          'Quyền truy cập thư viện hình ảnh cho phép bạn tải ảnh của mình lên khi tạo và chỉnh sửa tác vụ.',
    },
    'a4hhlvcj': {
      'en':
          'Camera permission allows you to take a photo directly to your tasks.',
      'vi':
          'Quyền truy cập camera cho phép bạn chụp hình khi tạo và chỉnh sửa tác vụ.',
    },
    'm3wkvza0': {
      'en':
          'Optional - In order to sync tasks you created in this app with your calendar, permission to access your Calendar is required.',
      'vi': '',
    },
    'w1vpyx4t': {
      'en': '',
      'vi': 'Lỗi: [error]',
    },
    '5y2et1as': {
      'en': '',
      'vi': 'Email khôi phục mật khẩu đã được gửi!',
    },
    'avvcw6y8': {
      'en': '',
      'vi': 'Vui lòng cung cấp email!',
    },
    'phfkhny6': {
      'en': '',
      'vi': '',
    },
    'tj3iii4k': {
      'en': '',
      'vi': 'Mật khẩu không trùng khớp',
    },
    'qo75wico': {
      'en': '',
      'vi': '',
    },
    'baoaevih': {
      'en': '',
      'vi':
          'Vui lòng đăng nhập lại để có thể thực hiện thao tác xóa tài khoản.',
    },
    'tqiogiv0': {
      'en': '',
      'vi':
          'Vui lòng đăng nhập lại để có thể thực hiện thao tác cập nhật email.',
    },
    '8l5srs19': {
      'en': '',
      'vi': 'Email cập nhật email đã được gửi!',
    },
    'pqtdtdp2': {
      'en': '',
      'vi': 'Email đang được sử dụng bởi một tài khoản khác',
    },
    '9n2i92e4': {
      'en': '',
      'vi': 'Thông tin đăng nhập bị sai hoặc đã hết hạn',
    },
    'isxaf7w2': {
      'en': '',
      'vi': 'Định dạng file không hợp lệ',
    },
    'ziwv7d2q': {
      'en': '',
      'vi': 'Đang tải lên...',
    },
    'pfkn8fbn': {
      'en': '',
      'vi': 'Thành công!',
    },
    '4ksbak2a': {
      'en': '',
      'vi': 'Tải lên thất bại',
    },
    't5y763td': {
      'en': '',
      'vi': '',
    },
    'knd6yvt7': {
      'en': '',
      'vi': 'Chọn nguồn',
    },
    '4godhpnf': {
      'en': '',
      'vi': 'Thư viện',
    },
    'swm9sfn0': {
      'en': '',
      'vi': 'Thư viện ảnh',
    },
    'd47u02gv': {
      'en': '',
      'vi': 'Thư viện video',
    },
    'w5vdulue': {
      'en': '',
      'vi': 'Máy ảnh',
    },
    '5qd66zh7': {
      'en': '',
      'vi': '',
    },
    'vlex7pbz': {
      'en': '',
      'vi': '',
    },
    'nzkzy4a7': {
      'en': '',
      'vi': '',
    },
    'kwqpn7sv': {
      'en': '',
      'vi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
