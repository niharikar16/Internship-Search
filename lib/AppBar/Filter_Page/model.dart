class Welcome {
  Map<String, InternshipsMeta> internshipsMeta;
  List<int> internshipIds;

  Welcome({
    required this.internshipsMeta,
    required this.internshipIds,
  });
}

class InternshipsMeta {
  int id;
  String title;
  EmploymentType employmentType;
  ApplicationStatusMessage applicationStatusMessage;
  dynamic jobTitle;
  bool workFromHome;
  Segment segment;
  dynamic segmentLabelValue;
  dynamic internshipTypeLabelValue;
  List<Segment> jobSegments;
  String companyName;
  String companyUrl;
  bool isPremium;
  bool isPremiumInternship;
  String employerName;
  CompanyLogo companyLogo;
  InternshipsMetaType type;
  String url;
  int isInternchallenge;
  bool isExternal;
  bool isActive;
  DateTime expiresAt;
  String closedAt;
  String profileName;
  bool partTime;
  StartDate startDate;
  Duration duration;
  Stipend stipend;
  dynamic salary;
  dynamic jobExperience;
  String experience;
  String postedOn;
  int postedOnDateTime;
  String applicationDeadline;
  String expiringIn;
  String postedByLabel;
  PostedByLabelType postedByLabelType;
  List<String> locationNames;
  List<Location> locations;
  DateTime startDateComparisonFormat;
  DateTime startDate1;
  DateTime startDate2;
  bool isPpo;
  bool isPpoSalaryDisclosed;
  dynamic ppoSalary;
  dynamic ppoSalary2;
  PpoLabelValue ppoLabelValue;
  bool toShowExtraLabel;
  String extraLabelValue;
  bool isExtraLabelBlack;
  List<dynamic> campaignNames;
  String campaignName;
  bool toShowInSearch;
  String campaignUrl;
  dynamic campaignStartDateTime;
  dynamic campaignLaunchDateTime;
  dynamic campaignEarlyAccessStartDateTime;
  dynamic campaignEndDateTime;
  List<LabelElement> labels;
  LabelsAppElement labelsApp;
  List<LabelsAppElement> labelsAppInCard;
  bool isCovidWfhSelected;
  bool toShowCardMessage;
  String message;
  bool isApplicationCappingEnabled;
  String applicationCappingMessage;
  List<dynamic> overrideMetaDetails;
  bool eligibleForEasyApply;
  bool eligibleForB2BApplyNow;
  bool toShowB2BLabel;
  bool isInternationalJob;
  bool toShowCoverLetter;
  String? officeDays;

  InternshipsMeta({
    required this.id,
    required this.title,
    required this.employmentType,
    required this.applicationStatusMessage,
    required this.jobTitle,
    required this.workFromHome,
    required this.segment,
    required this.segmentLabelValue,
    required this.internshipTypeLabelValue,
    required this.jobSegments,
    required this.companyName,
    required this.companyUrl,
    required this.isPremium,
    required this.isPremiumInternship,
    required this.employerName,
    required this.companyLogo,
    required this.type,
    required this.url,
    required this.isInternchallenge,
    required this.isExternal,
    required this.isActive,
    required this.expiresAt,
    required this.closedAt,
    required this.profileName,
    required this.partTime,
    required this.startDate,
    required this.duration,
    required this.stipend,
    required this.salary,
    required this.jobExperience,
    required this.experience,
    required this.postedOn,
    required this.postedOnDateTime,
    required this.applicationDeadline,
    required this.expiringIn,
    required this.postedByLabel,
    required this.postedByLabelType,
    required this.locationNames,
    required this.locations,
    required this.startDateComparisonFormat,
    required this.startDate1,
    required this.startDate2,
    required this.isPpo,
    required this.isPpoSalaryDisclosed,
    required this.ppoSalary,
    required this.ppoSalary2,
    required this.ppoLabelValue,
    required this.toShowExtraLabel,
    required this.extraLabelValue,
    required this.isExtraLabelBlack,
    required this.campaignNames,
    required this.campaignName,
    required this.toShowInSearch,
    required this.campaignUrl,
    required this.campaignStartDateTime,
    required this.campaignLaunchDateTime,
    required this.campaignEarlyAccessStartDateTime,
    required this.campaignEndDateTime,
    required this.labels,
    required this.labelsApp,
    required this.labelsAppInCard,
    required this.isCovidWfhSelected,
    required this.toShowCardMessage,
    required this.message,
    required this.isApplicationCappingEnabled,
    required this.applicationCappingMessage,
    required this.overrideMetaDetails,
    required this.eligibleForEasyApply,
    required this.eligibleForB2BApplyNow,
    required this.toShowB2BLabel,
    required this.isInternationalJob,
    required this.toShowCoverLetter,
    required this.officeDays,
  });
}

class ApplicationStatusMessage {
  bool toShow;
  Message message;
  ApplicationStatusMessageType type;

  ApplicationStatusMessage({
    required this.toShow,
    required this.message,
    required this.type,
  });
}

enum Message { THE_0_APPLICANTS, THE_1_APPLICANTS, THE_2_APPLICANTS }

enum ApplicationStatusMessageType { HIGH_APPLICATIONS }

enum CompanyLogo {
  EMPTY,
  THE_6385_F8_A1_C006_B1669724321_PNG,
  THE_7_GZRSOJ5_KO8_4424_PNG
}

enum Duration { THE_2_MONTHS, THE_3_MONTHS, THE_5_MONTHS }

enum EmploymentType { INTERNSHIP }

enum Segment { EMPTY, INTERNSHIP_FOR_WOMEN }

class LabelElement {
  List<LabelsAppElement> labelValue;
  List<LabelsAppElement> labelMobile;
  List<LabelsAppElement> labelApp;
  List<LabelsAppElement> labelsAppInCard;

  LabelElement({
    required this.labelValue,
    required this.labelMobile,
    required this.labelApp,
    required this.labelsAppInCard,
  });
}

enum LabelsAppElement { INTERNATIONAL, INTERNSHIP }

class Location {
  String string;
  String link;
  Country country;
  String? region;
  String locationName;

  Location({
    required this.string,
    required this.link,
    required this.country,
    required this.region,
    required this.locationName,
  });
}

enum Country { INDIA, PHILIPPINES }

enum PostedByLabelType { INFO, SUCCESS }

enum PpoLabelValue { WITH_JOB_OFFER }

enum StartDate { STARTS_IMMEDIATELY }

class Stipend {
  String salary;
  dynamic tooltip;
  int salaryValue1;
  dynamic salaryValue2;
  SalaryType salaryType;
  Currency currency;
  Scale scale;
  bool largeStipendText;

  Stipend({
    required this.salary,
    required this.tooltip,
    required this.salaryValue1,
    required this.salaryValue2,
    required this.salaryType,
    required this.currency,
    required this.scale,
    required this.largeStipendText,
  });
}

enum Currency { INR }

enum SalaryType { FIXED }

enum Scale { PERMONTH }

enum InternshipsMetaType { REGULAR, VIRTUAL }
