class AppLocalizations {
  final String locale;

  AppLocalizations(this.locale);

  // Assuming you have this somewhereص
  bool get isArabic => locale == 'ar';

  String get permissions => isArabic ? 'الصلاحيات' : 'Permissions';

  String get activate => isArabic ? 'تفعيل' : 'Activate';
  String get actionType => isArabic ? 'نوع الإجراء' : 'Action Type';
  String get actionDate => isArabic ? 'تاريخ الإجراء' : 'Action Date';
  String get unitName => isArabic ? 'اسم الوحدة' : 'Unit Name';
  String get floorNumber => isArabic ? 'رقم الطابق' : 'Floor Number';
  String get meetingType => isArabic ? 'نوع الاجتماع' : 'Meeting Type';
  String get meetingLocation => isArabic ? 'موقع الاجتماع' : 'Meeting Location';

  String get actionSavedSuccessfully =>
      isArabic ? 'تم إضافة الإجراء بنجاح' : 'Action saved successfully';

  String get addAction => isArabic ? 'إضافة إجراء' : 'Add Action';

  String get deactivate => isArabic ? 'تعطيل' : 'Deactivate';

  String get userAddedSuccessfully =>
      isArabic ? 'تم إضافة المستخدم بنجاح' : 'User added successfully';

  String get deleted => isArabic ? 'تم حذفه' : 'Deleted';

  String get editUser => isArabic ? 'تعديل المستخدم' : 'Edit User';

  String get userEditedSuccessfully =>
      isArabic ? 'تم تعديل المستخدم بنجاح' : 'User edited successfully';

  String get newUser => isArabic ? 'مستخدم جديد' : 'New User';
  String get clientAddedSuccessfully =>
      isArabic ? 'تم إضافة العميل بنجاح' : 'Client added successfully';

  String get online => isArabic ? 'اونلاين' : 'Online';
  String get offline => isArabic ? 'أوفلاين' : 'Offline';
  String get indoor => isArabic ? 'في المكتب' : 'Indoor';
  String get outdoor => isArabic ? 'في الخارج' : 'Outdoor';

  String get apartment => isArabic ? 'شقة' : 'Apartment';
  String get call => isArabic ? 'اتصال' : 'Call';
  String get cancelled => isArabic ? 'ملغي' : 'Cancelled';
  String get interested => isArabic ? 'مهتم' : 'Interested';
  String get executor => isArabic ? 'المنفذ' : 'Executor';
  String get date => isArabic ? 'التاريخ' : 'Date';
  String get selectActionType =>
      isArabic ? 'اختر نوع الإجراء' : 'Select Action Type';
  String get vieew => isArabic ? 'عرض' : 'View';
  String get hours => isArabic ? ' ساعة' : 'Hours';
  String get twoHours => isArabic ? 'ساعتين' : 'Two Hours';
  String get nextDay => isArabic ? 'اليوم التالي' : 'Next Day';
  String get nextWeek => isArabic ? 'الأسبوع التالي' : 'Next Week';
  String get deal => isArabic ? 'صفقة' : 'Deal';
  String get booked => isArabic ? 'محجوز' : 'Booked';
  String get meeting => isArabic ? 'اجتماع' : 'Meeting';
  String get rental => isArabic ? 'إيجار' : 'Rental';
  String get company => isArabic ? 'شركة' : 'Company';
  String get owner => isArabic ? 'مالك' : 'Owner';
  String get m => isArabic ? 'م2' : 'M2';
  String get unitDetails => isArabic ? 'تفاصيل الوحدة' : 'Unit Details';
  String get projectArea => isArabic ? 'مساحة المشروع' : 'Project Area';
  String get tasksMenu => isArabic ? 'المهام' : 'Tasks';
  String get villa => isArabic ? 'فيلا' : 'Villa';
  String get townhouse => isArabic ? 'تاون هاوس' : 'Townhouse';
  String get bedrooms => isArabic ? 'غرف النوم' : 'Bedrooms';
  String get bathrooms => isArabic ? 'الحمامات' : 'Bathrooms';
  String get unitComponents => isArabic ? 'مكونات الوحدة' : 'Unit Components';
  String get floor => isArabic ? 'الطابق' : 'Floor';
  String get land => isArabic ? 'أرض' : 'Land';
  String get undefined => isArabic ? 'غير محدد' : 'Undefined';
  String get viewOnMap => isArabic ? 'عرض على الخريطة' : 'View on map';
  String get view => isArabic ? 'إطلالة' : 'View';
  String get finshing => isArabic ? 'تشطيب' : 'Finshing';

  String get yes => isArabic ? 'نعم' : 'Yes';
  String get no => isArabic ? 'لا' : 'No';
  String get country => isArabic ? 'الدولة' : 'Country';
  String get governorate => isArabic ? "المحافظة" : 'Governorate';
  String get city => isArabic ? 'المدينة' : 'City';
  String get street => isArabic ? 'الشارع' : 'Street';
  String get district => isArabic ? 'الحي' : 'District';

  String get minutesAgo => isArabic ? 'دقائق مضت' : 'Minutes ago';
  String get unitBasicDetails =>
      isArabic ? 'تفاصيل الوحدة' : 'Unit Basic Details';
  String get unitType => isArabic ? 'نوع الوحدة' : 'Unit Type';
  String get hasElevator => isArabic ? 'المصعد' : 'Has Elevator';
  String get sellPurpose => isArabic ? 'الغرض من البيع' : 'Sell Purpose';
  String get isStandalone => isArabic ? 'وحدة مستقلة' : 'Is Standalone';
  String get floors => isArabic ? 'عدد الطوابق' : 'Floors';
  String get noOfTempeletes => isArabic ? 'عدد القوالب' : 'No Of Tempeletes';
  String get createdAt => isArabic ? 'تاريخ الإنشاء' : 'Created At';
  String get updatedAt => isArabic ? 'آخر تحديث' : 'Updated At';
  String get hoursAgo => isArabic ? 'ساعات مضت' : 'Hours ago';
  String get selectCountry => isArabic ? 'اختر الدولة' : 'Select Country';
  String get facebook => isArabic ? 'فيس بوك' : 'Facebook';
  String get leader => isArabic ? 'قائد' : 'Leader';
  String get selectLeaderName =>
      isArabic ? 'اختر اسم القائد  ' : 'Select Leader Name';
  String get leaderName => isArabic ? 'قائد' : 'Leader';

  String get unitPriceAndArea =>
      isArabic ? 'سعر الوحدة و المساحة' : 'Unit Price And Area';
  String get unitCode => isArabic ? 'كود الوحدة' : 'Unit Code';

  String get addNewUser => isArabic ? 'إضافة مستخدم جديد' : 'Add New User';
  String get writeName => isArabic ? 'اكتب الاسم' : 'Write Name';
  String get userManagements =>
      isArabic ? 'إدارة المستخدمين' : 'Users Management';
  String get direct => isArabic ? ' مباشر' : 'Direct';
  String get salesName => isArabic ? 'اسم المندوب  ' : 'Sales Name';
  String get selectSalesName =>
      isArabic ? 'اختر اسم المندوب  ' : 'Select Sales Name';
  String get google => isArabic ? 'غوغل' : 'Google';
  String get tikTok => isArabic ? 'تيكتوك' : 'TikTok';
  String get snapchat => isArabic ? 'سناب شات' : 'Snapchat';
  String get instagram => isArabic ? 'انستغرام' : 'Instagram';
  String get youtube => isArabic ? 'يوتيوب' : 'Youtube';
  String get whatsapp => isArabic ? 'واتساب' : 'WhatsApp';
  String get sms => isArabic ? 'س ا ام' : 'SMS';
  String get daysAgo => isArabic ? 'أيام مضت' : 'Days ago';
  String get justNow => isArabic ? 'الآن' : 'Just now';
  String get clientNameen =>
      isArabic ? 'اسم العميل باللغة الإنجليزية' : 'Client Name en';
  String get preferredMethodOfContact =>
      isArabic ? 'الاتصال' : 'Preferred method of contact';
  String get selectPreferredMethodOfContact =>
      isArabic ? 'اختر طريقة الاتصال' : 'Select Preferred method of contact';
  String get clientStatus => isArabic ? 'الحالة' : 'Client Status';
  String get addProject => isArabic ? 'إضافة مشروع' : 'Add Project';
  String get addTask => isArabic ? 'إضافة مهمة' : 'Add Task';
  String get taskAddedSuccessfully =>
      isArabic ? 'تم إضافة المهمة بنجاح' : 'Task Added Successfully';
  String get addClient => isArabic ? 'إضافة عميل' : 'Add Client';

  String get selectClientStatus =>
      isArabic ? 'اختر حالة العميل' : 'Select Client Status';
  String get writeJob => isArabic ? 'اكتب الوظيفة' : 'Write Job';
  String get writeOtherPhoneNumber =>
      isArabic ? 'اكتب رقم الهاتف الآخر' : 'Write Other Phone Number';
  String get writePhoneNumber =>
      isArabic ? 'اكتب رقم الهاتف' : 'Write Phone Number';
  String get writeSecondaryPhoneNumber =>
      isArabic ? 'اكتب رقم الهاتف الآخر' : 'Write Secondary Phone Number';
  String get writeEmail => isArabic ? 'اكتب البريد الالكتروني' : 'Write Email';
  String get active => isArabic ? 'نشط' : 'Active';
  String get inactive => isArabic ? 'غير نشط' : 'Inactive';
  String get save => isArabic ? 'حفظ' : 'Save';
  String get allClients => isArabic ? 'كل العملاء' : 'All Clients';
  String get myClients => isArabic ? 'عملائي' : 'My Clients';
  String get createNewClient =>
      isArabic ? 'إنشاء عميل جديد' : 'Create New Client';
  String get enterClientNameHere =>
      isArabic ? 'أدخل اسم العميل هنا' : 'Enter Client Name Here';
  String get newClients => isArabic ? 'عملاء جدد' : 'New Clients';
  String get selectProject => isArabic ? 'اختر المشروع' : 'Select Project';
  String get selectChannel => isArabic ? 'اختر القناة' : 'Select Channel';
  String get selectPriority => isArabic ? 'اختر الأولوية' : 'Select Priority';
  String get deferredClients => isArabic ? 'عملاء مؤجلون' : 'Deferred Clients';
  String get followUp => isArabic ? 'متابعة' : 'Follow up';
  String get rent => isArabic ? 'إيجار' : 'Rent';
  String get comment => isArabic ? 'تعليق' : 'Comment';
  String get reservation => isArabic ? 'حجز' : 'Reservation';
  String get interest => isArabic ? 'اهتمام' : 'Interest';
  String get archive => isArabic ? 'الأرشيف' : 'Archive';
  String get followAfterMeeting =>
      isArabic ? 'متابعة بعد الاجتماع' : 'Follow after Meeting';
  String get meetingSchedule => isArabic ? 'جدول المواعيد' : 'Meeting Schedule';
  String get sold => isArabic ? 'تم البيع' : 'Sold';
  String get newLabel => isArabic ? 'جديد' : 'New';
  String get cancel => isArabic ? 'إلغاء' : 'Cancel';

  // --- Client Details Filters (List 2) ---
  String get details => isArabic ? 'التفاصيل' : 'Details';
  String get comments => isArabic ? 'التعليقات' : 'Comments';
  String get attachments => isArabic ? 'المرفقات' : 'Attachments';
  String get timeline => isArabic ? 'سجل الأحداث' : 'Timeline';
  String get deals => isArabic ? 'الصفقات' : 'Deals';
  String get chances => isArabic ? 'الفرص' : 'Chances';
  String get cliRequest => isArabic ? 'طلب العميل' : 'Cli Request';
  String get contracts => isArabic ? 'العقود' : 'Contracts';
  String get paymentPlan => isArabic ? 'خطة الدفع' : 'Payment Plan';
  String get checkIn => isArabic ? 'تسجيل حضور' : 'Check In';

  // Lead status translations as getters
  String get notAssigned => isArabic ? 'غير مكلف' : 'Not Assigned';
  String get status => isArabic ? 'الحالة' : 'Status';
  String get project => isArabic ? 'مشروع' : 'Project';
  String get englishName => isArabic ? 'الاسم بالإنجليزية' : 'English Name';
  String get projectCount => isArabic ? 'عدد المشاريع' : 'Project Count';
  String get jobTitle => isArabic ? 'الوظيفة' : 'Job Title';
  String get email => isArabic ? 'البريد الالكتروني' : 'Email';
  String get phone => isArabic ? 'الهاتف' : 'Phone';
  String get secondaryPhone => isArabic ? 'هاتف اخر' : 'Secondary Phone';
  String get channel => isArabic ? 'القناة' : 'Channel';
  String get assignedTo => isArabic ? 'المكلف به' : 'Assigned To';
  String get creationDate => isArabic ? 'التاريخ' : 'Creation Date';
  String get budget => isArabic ? 'الميزانية' : 'Budget';
  String get newLead => isArabic ? 'جديد' : 'New';
  String get conected => isArabic ? 'تم الاتصال' : 'Connected';
  String get qualified => isArabic ? 'صفقة مؤهلة' : 'Qualified Deal';
  String get closed => isArabic ? 'مغلق' : 'Closed';
  String get customer => isArabic ? 'عميل' : 'Customer';

  String get newDeals => isArabic ? 'الصفقات الجديدة' : 'New Deals';
  String get conversionRate => isArabic ? 'نسبة التحويل' : 'Conversion Rate';
  String get totalSales => isArabic ? 'إجمالي المبيعات' : 'Total Sales';
  String get loginFailed => isArabic ? 'فشل التسجيل' : 'Login Failed';
  String get enterEmail =>
      isArabic ? '  ادخل البريد الالكتروني' : 'Enter Email';
  String get enterPassword =>
      isArabic ? '  ادخل كلمة المرور' : 'Enter Password';
  String get passwordMustBeAtLeast8CharactersLong => isArabic
      ? 'يجب أن تكون كلمة المرور على الأقل 8 أحرف'
      : 'Password must be at least 8 characters long';

  String get atLeastOneLowercaseLetter =>
      isArabic ? 'يجب أن تحتوي على حرف صغير' : 'At least one lowercase letter';

  String get atLeastOneUppercaseLetter =>
      isArabic ? 'يجب أن تحتوي على حرف كبير' : 'At least one uppercase letter';

  String get atLeastOneNumber =>
      isArabic ? 'يجب أن تحتوي على رقم' : 'At least one number';

  String get atLeastOneSpecialCharacter =>
      isArabic ? 'يجب أن تحتوي على حرف خاصة' : 'At least one special character';

  String get atLeast8Characters =>
      isArabic ? 'يجب أن تحتوي على 8 أحرف' : 'At least 8 characters';

  String get realEstateCrmSystem =>
      isArabic ? 'نظام إدارة علاقات العملاء' : 'Real Estate CRM System';

  // =============================================================
  // GENERAL / COMMON
  // =============================================================
  String get more => isArabic ? 'المزيد' : 'More';
  String get aqaria => isArabic ? 'عقاري' : 'AQARIA';

  String get home => isArabic ? 'الرئيسية' : 'Home';
  String get clients => isArabic ? 'العملاء' : 'Clients';
  String get calendar => isArabic ? 'التقويم' : 'Calendar';
  String get welcome => isArabic ? 'مرحباً' : 'Welcome';
  String get appName => isArabic ? 'إدارة علاقات العملاء' : 'CRM';
  String get loading => isArabic ? 'جاري التحميل...' : 'Loading...';
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

  String get ok => isArabic ? 'حسناً' : 'OK';
  String get salesperformancestages =>
      isArabic ? ' أداء المبيعات' : 'Sales Performance';
  String get done => isArabic ? 'تم' : 'Done';
  String get close => isArabic ? 'إغلاق' : 'Close';
  String get viewall => isArabic ? 'عرض الكل' : 'View All';

  String get viewdetails => isArabic ? 'عرض التفاصيل' : 'View Details';
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
  String get editClient => isArabic ? 'تعديل العميل' : 'Edit Client';
  String get deleteClient => isArabic ? 'حذف العميل' : 'Delete Client';

  // =============================================================
  // UNITS
  // =============================================================
  String get units => isArabic ? 'الوحدات' : 'Units';
  String get unit => isArabic ? 'وحدة' : 'Unit';
  String get unitNumber => isArabic ? 'رقم الوحدة' : 'Unit Number';
  String get unitArea => isArabic ? 'مساحة الوحدة' : 'Unit Area';
  String get unitPrice => isArabic ? 'سعر الوحدة' : 'Unit Price';
  String get available => isArabic ? 'متاح' : 'Available';
  String get reserved => isArabic ? 'محجوز' : 'Reserved';

  // =============================================================
  // SALES / DEALS
  // =============================================================
  String get sales => isArabic ? 'المبيعات' : 'Sales';
  String get contract => isArabic ? 'العقد' : 'Contract';
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
  String get changelanguage => isArabic ? 'تغيير اللغة' : 'Change Language';
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
