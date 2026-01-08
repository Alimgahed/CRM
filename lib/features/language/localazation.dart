// =============================================================
// MAIN APP LOCALIZATION
// lib/core/localization/app_localizations.dart
// =============================================================

class AppLocalizations {
  final String locale;

  AppLocalizations(this.locale);

  bool get isArabic => locale == 'ar';

  // =============================================================
  // GENERAL / COMMON
  // =============================================================
  String get more => isArabic ? 'المزيد' : 'More';

  String get home => isArabic ? 'الرئيسية' : 'Home';
  String get clients => isArabic ? 'العملاء' : 'Clients';
  String get calendar => isArabic ? 'التقويم' : 'Calendar';
  String get welcome => isArabic ? 'مرحباً' : 'Welcome';
  String get appName => isArabic ? 'إدارة علاقات العملاء' : 'CRM';
  String get loading => isArabic ? 'جاري التحميل...' : 'Loading...';
  String get save => isArabic ? 'حفظ' : 'Save';
  String get cancel => isArabic ? 'إلغاء' : 'Cancel';
  String get delete => isArabic ? 'حذف' : 'Delete';
  String get edit => isArabic ? 'تعديل' : 'Edit';
  String get add => isArabic ? 'إضافة' : 'Add';
  String get search => isArabic ? 'بحث' : 'Search';
  String get filter => isArabic ? 'تصفية' : 'Filter';
  String get back => isArabic ? 'رجوع' : 'Back';
  String get next => isArabic ? 'التالي' : 'Next';
  String get previous => isArabic ? 'السابق' : 'Previous';
  String get submit => isArabic ? 'إرسال' : 'Submit';
  String get confirm => isArabic ? 'تأكيد' : 'Confirm';
  String get yes => isArabic ? 'نعم' : 'Yes';
  String get no => isArabic ? 'لا' : 'No';
  String get ok => isArabic ? 'حسناً' : 'OK';
  String get done => isArabic ? 'تم' : 'Done';
  String get close => isArabic ? 'إغلاق' : 'Close';
  String get view => isArabic ? 'عرض التفاصيل' : 'View Details';
  String get download => isArabic ? 'تحميل' : 'Download';
  String get open => isArabic ? 'فتح' : 'Open';
  String get share => isArabic ? 'مشاركة' : 'Share';
  String get refresh => isArabic ? 'تحديث' : 'Refresh';
  String get retry => isArabic ? 'إعادة المحاولة' : 'Retry';
  String get error => isArabic ? 'خطأ' : 'Error';
  String get success => isArabic ? 'نجح' : 'Success';
  String get warning => isArabic ? 'تحذير' : 'Warning';
  String get info => isArabic ? 'معلومات' : 'Info';
  String get noData => isArabic ? 'لا توجد بيانات' : 'No Data';
  String get noResults => isArabic ? 'لا توجد نتائج' : 'No Results';
  String get projectsMenu => isArabic ? 'المشاريع' : 'Projects';
  String get unitsMenu => isArabic ? 'الوحدات' : 'Units';
  String get developersMenu =>
      isArabic ? 'شركات التطوير' : 'Developers Companies';
  String get ownersMenu => isArabic ? 'الملاك' : 'Owners';
  String get commissionsMenu => isArabic ? 'العمولات' : 'Commissions';
  String get reportsMenu => isArabic ? 'التقارير' : 'Reports';
  String get usersPermissionsMenu =>
      isArabic ? 'المستخدمون والصلاحيات' : 'Users and Permissions';
  String get importData => isArabic ? 'استيراد البيانات' : 'Import Data';
  String get exportData => isArabic ? 'تصدير البيانات' : 'Export Data';
  String get helpCenter => isArabic ? 'مركز المساعدة' : 'Help Center';

  // =============================================================
  // GENERAL / COMMON

  String get logout => isArabic ? 'تسجيل الخروج' : 'Logout';
  String get settings => isArabic ? 'الإعدادات' : 'Settings';
  // =============================================================
  // PROJECT DETAILS
  // =============================================================
  String get projectDetails => isArabic ? 'تفاصيل المشروع' : 'Project Details';
  String get projectInformation =>
      isArabic ? 'معلومات المشروع' : 'Project Information';
  String get description => isArabic ? 'الوصف' : 'Description';
  String get location => isArabic ? 'الموقع' : 'Location';
  String get contactPerson => isArabic ? 'جهة الاتصال' : 'Contact Person';
  String get contactNumber => isArabic ? 'رقم الهاتف' : 'Contact Number';
  String get projectType => isArabic ? 'نوع المشروع' : 'Project Type';
  String get planDescription => isArabic ? 'وصف المخطط' : 'Plan Description';
  String get prefix => isArabic ? 'البادئة' : 'Prefix';

  // Price & Area
  String get priceAndArea => isArabic ? 'السعر والمساحة' : 'Price & Area';
  String get meterPrice => isArabic ? 'سعر المتر' : 'Meter Price';
  String get areaRange => isArabic ? 'نطاق المساحة' : 'Area Range';
  String get totalPrice => isArabic ? 'السعر الإجمالي' : 'Total Price';
  String get pricePerMeter => isArabic ? 'سعر المتر' : 'Price Per Meter';

  // Developer
  String get developerCompany =>
      isArabic ? 'الشركة المطورة' : 'Developer Company';
  String get arabicName => isArabic ? 'الاسم بالعربية' : 'Arabic Name';
  String get englishName => isArabic ? 'الاسم بالإنجليزية' : 'English Name';
  String get phone => isArabic ? 'الهاتف' : 'Phone';
  String get email => isArabic ? 'البريد الإلكتروني' : 'Email';
  String get status => isArabic ? 'الحالة' : 'Status';
  String get active => isArabic ? 'نشط' : 'Active';
  String get inactive => isArabic ? 'غير نشط' : 'Inactive';

  // Payment Plans
  String get paymentPlans => isArabic ? 'خطط الدفع' : 'Payment Plans';
  String get years => isArabic ? 'السنوات' : 'Years';
  String get downPayment => isArabic ? 'الدفعة المقدمة' : 'Down Payment';
  String get yearlyInstallment =>
      isArabic ? 'القسط السنوي' : 'Yearly Installment';
  String get monthlyInstallment =>
      isArabic ? 'القسط الشهري' : 'Monthly Installment';
  String get discount => isArabic ? 'الخصم' : 'Discount';
  String get installments => isArabic ? 'الأقساط' : 'Installments';

  // Stages
  String get projectStages => isArabic ? 'مراحل المشروع' : 'Project Stages';
  String get stageName => isArabic ? 'اسم المرحلة' : 'Stage Name';
  String get stageCode => isArabic ? 'كود المرحلة' : 'Stage Code';
  String get groups => isArabic ? 'المجموعات' : 'Groups';

  // Attachments
  String get attachments => isArabic ? 'المرفقات' : 'Attachments';
  String get attachment => isArabic ? 'مرفق' : 'Attachment';
  String get downloading => isArabic ? 'جاري التحميل...' : 'Downloading...';
  String get fileDownloaded => isArabic ? 'تم تحميل الملف' : 'File downloaded';
  String get downloadFailed => isArabic ? 'فشل التحميل' : 'Download failed';
  String get fileDownloadedToDownloads => isArabic
      ? 'تم تحميل الملف إلى مجلد التنزيلات'
      : 'File downloaded to Downloads folder';

  // Project Types
  String get residential => isArabic ? 'سكني' : 'Residential';
  String get commercial => isArabic ? 'تجاري' : 'Commercial';
  String get mixedUse => isArabic ? 'استخدام مختلط' : 'Mixed Use';
  String get industrial => isArabic ? 'صناعي' : 'Industrial';
  String get administrative => isArabic ? 'إداري' : 'Administrative';

  String getProjectType(int type) {
    switch (type) {
      case 1:
        return residential;
      case 2:
        return commercial;
      case 3:
        return mixedUse;
      case 4:
        return industrial;
      case 5:
        return administrative;
      default:
        return isArabic ? 'نوع $type' : 'Type $type';
    }
  }

  // =============================================================
  // PROJECTS LIST
  // =============================================================
  String get projects => isArabic ? 'المشاريع' : 'Projects';
  String get allProjects => isArabic ? 'جميع المشاريع' : 'All Projects';
  String get myProjects => isArabic ? 'مشاريعي' : 'My Projects';
  String get recentProjects =>
      isArabic ? 'المشاريع الأخيرة' : 'Recent Projects';
  String get searchProjects =>
      isArabic ? 'البحث في المشاريع' : 'Search Projects';
  String get noProjectsFound =>
      isArabic ? 'لم يتم العثور على مشاريع' : 'No projects found';

  // =============================================================
  // CLIENTS / CUSTOMERS
  // =============================================================
  String get client => isArabic ? 'عميل' : 'Client';
  String get clientName => isArabic ? 'اسم العميل' : 'Client Name';
  String get clientDetails => isArabic ? 'تفاصيل العميل' : 'Client Details';
  String get addClient => isArabic ? 'إضافة عميل' : 'Add Client';
  String get editClient => isArabic ? 'تعديل العميل' : 'Edit Client';
  String get deleteClient => isArabic ? 'حذف العميل' : 'Delete Client';

  // =============================================================
  // UNITS
  // =============================================================
  String get units => isArabic ? 'الوحدات' : 'Units';
  String get unit => isArabic ? 'وحدة' : 'Unit';
  String get unitNumber => isArabic ? 'رقم الوحدة' : 'Unit Number';
  String get unitType => isArabic ? 'نوع الوحدة' : 'Unit Type';
  String get unitArea => isArabic ? 'مساحة الوحدة' : 'Unit Area';
  String get unitPrice => isArabic ? 'سعر الوحدة' : 'Unit Price';
  String get available => isArabic ? 'متاح' : 'Available';
  String get reserved => isArabic ? 'محجوز' : 'Reserved';
  String get sold => isArabic ? 'مباع' : 'Sold';

  // =============================================================
  // SALES / DEALS
  // =============================================================
  String get sales => isArabic ? 'المبيعات' : 'Sales';
  String get deals => isArabic ? 'الصفقات' : 'Deals';
  String get contract => isArabic ? 'العقد' : 'Contract';
  String get contracts => isArabic ? 'العقود' : 'Contracts';
  String get reservation => isArabic ? 'الحجز' : 'Reservation';
  String get reservations => isArabic ? 'الحجوزات' : 'Reservations';

  // =============================================================
  // FINANCIAL
  // =============================================================
  String get financial => isArabic ? 'المالية' : 'Financial';
  String get payment => isArabic ? 'الدفع' : 'Payment';
  String get payments => isArabic ? 'المدفوعات' : 'Payments';
  String get invoice => isArabic ? 'الفاتورة' : 'Invoice';
  String get invoices => isArabic ? 'الفواتير' : 'Invoices';
  String get receipt => isArabic ? 'الإيصال' : 'Receipt';
  String get receipts => isArabic ? 'الإيصالات' : 'Receipts';
  String get paymentDate => isArabic ? 'تاريخ الدفع' : 'Payment Date';
  String get amount => isArabic ? 'المبلغ' : 'Amount';
  String get paidAmount => isArabic ? 'المبلغ المدفوع' : 'Paid Amount';
  String get remainingAmount =>
      isArabic ? 'المبلغ المتبقي' : 'Remaining Amount';

  // =============================================================
  // AUTHENTICATION
  // =============================================================
  String get login => isArabic ? 'تسجيل الدخول' : 'Login';
  String get register => isArabic ? 'تسجيل' : 'Register';
  String get username => isArabic ? 'اسم المستخدم' : 'Username';
  String get password => isArabic ? 'كلمة المرور' : 'Password';
  String get confirmPassword =>
      isArabic ? 'تأكيد كلمة المرور' : 'Confirm Password';
  String get forgotPassword =>
      isArabic ? 'نسيت كلمة المرور؟' : 'Forgot Password?';
  String get rememberMe => isArabic ? 'تذكرني' : 'Remember Me';

  // =============================================================
  // SETTINGS
  // =============================================================
  String get profile => isArabic ? 'الملف الشخصي' : 'Profile';
  String get language => isArabic ? 'اللغة' : 'Language';
  String get notifications => isArabic ? 'الإشعارات' : 'Notifications';
  String get theme => isArabic ? 'المظهر' : 'Theme';
  String get darkMode => isArabic ? 'الوضع الداكن' : 'Dark Mode';
  String get lightMode => isArabic ? 'الوضع الفاتح' : 'Light Mode';

  // =============================================================
  // VALIDATION MESSAGES
  // =============================================================
  String get requiredField =>
      isArabic ? 'هذا الحقل مطلوب' : 'This field is required';
  String get invalidEmail =>
      isArabic ? 'البريد الإلكتروني غير صالح' : 'Invalid email';
  String get invalidPhone =>
      isArabic ? 'رقم الهاتف غير صالح' : 'Invalid phone number';
  String get passwordTooShort =>
      isArabic ? 'كلمة المرور قصيرة جداً' : 'Password is too short';
  String get passwordsDoNotMatch =>
      isArabic ? 'كلمات المرور غير متطابقة' : 'Passwords do not match';

  // =============================================================
  // DATE & TIME
  // =============================================================
  String get today => isArabic ? 'اليوم' : 'Today';
  String get yesterday => isArabic ? 'أمس' : 'Yesterday';
  String get tomorrow => isArabic ? 'غداً' : 'Tomorrow';
  String get date => isArabic ? 'التاريخ' : 'Date';
  String get time => isArabic ? 'الوقت' : 'Time';
  String get startDate => isArabic ? 'تاريخ البداية' : 'Start Date';
  String get endDate => isArabic ? 'تاريخ النهاية' : 'End Date';

  // =============================================================
  // UNITS OF MEASUREMENT
  // =============================================================
  String get sqm => isArabic ? 'م²' : 'm²';
  String get egp => isArabic ? 'ج.م' : 'EGP';
  String get usd => isArabic ? 'دولار' : 'USD';

  // =============================================================
  // ERROR MESSAGES
  // =============================================================
  String get somethingWentWrong =>
      isArabic ? 'حدث خطأ ما' : 'Something went wrong';
  String get noInternetConnection =>
      isArabic ? 'لا يوجد اتصال بالإنترنت' : 'No internet connection';
  String get serverError => isArabic ? 'خطأ في الخادم' : 'Server error';
  String get requestTimeout =>
      isArabic ? 'انتهت مهلة الطلب' : 'Request timeout';
  String get unauthorized => isArabic ? 'غير مصرح' : 'Unauthorized';

  // =============================================================
  // SUCCESS MESSAGES
  // =============================================================
  String get savedSuccessfully =>
      isArabic ? 'تم الحفظ بنجاح' : 'Saved successfully';
  String get deletedSuccessfully =>
      isArabic ? 'تم الحذف بنجاح' : 'Deleted successfully';
  String get updatedSuccessfully =>
      isArabic ? 'تم التحديث بنجاح' : 'Updated successfully';
  String get addedSuccessfully =>
      isArabic ? 'تمت الإضافة بنجاح' : 'Added successfully';

  // =============================================================
  // CONFIRMATION MESSAGES
  // =============================================================
  String get areYouSure => isArabic ? 'هل أنت متأكد؟' : 'Are you sure?';
  String get deleteConfirmation =>
      isArabic ? 'هل تريد حذف هذا العنصر؟' : 'Do you want to delete this item?';
  String get logoutConfirmation =>
      isArabic ? 'هل تريد تسجيل الخروج؟' : 'Do you want to logout?';
}
