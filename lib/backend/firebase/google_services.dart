class GoogleService {
  ProjectInfo? projectInfo;
  List<Client>? client;
  String? configurationVersion;

  GoogleService({this.projectInfo, this.client, this.configurationVersion});

  GoogleService.fromJson(Map<String, dynamic> json) {
    projectInfo = json['project_info'] != null
        ? new ProjectInfo.fromJson(json['project_info'])
        : null;
    if (json['client'] != null) {
      client = <Client>[];
      json['client'].forEach((v) {
        client!.add(new Client.fromJson(v));
      });
    }
    configurationVersion = json['configuration_version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.projectInfo != null) {
      data['project_info'] = this.projectInfo!.toJson();
    }
    if (this.client != null) {
      data['client'] = this.client!.map((v) => v.toJson()).toList();
    }
    data['configuration_version'] = this.configurationVersion;
    return data;
  }
}

class ProjectInfo {
  String? projectNumber;
  String? projectId;
  String? storageBucket;

  ProjectInfo({this.projectNumber, this.projectId, this.storageBucket});

  ProjectInfo.fromJson(Map<String, dynamic> json) {
    projectNumber = json['project_number'];
    projectId = json['project_id'];
    storageBucket = json['storage_bucket'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project_number'] = this.projectNumber;
    data['project_id'] = this.projectId;
    data['storage_bucket'] = this.storageBucket;
    return data;
  }
}

class Client {
  ClientInfo? clientInfo;
  List<OauthClient>? oauthClient;
  List<ApiKey>? apiKey;
  Services? services;

  Client({this.clientInfo, this.oauthClient, this.apiKey, this.services});

  Client.fromJson(Map<String, dynamic> json) {
    clientInfo = json['client_info'] != null
        ? new ClientInfo.fromJson(json['client_info'])
        : null;
    if (json['oauth_client'] != null) {
      oauthClient = <OauthClient>[];
      json['oauth_client'].forEach((v) {
        oauthClient!.add(new OauthClient.fromJson(v));
      });
    }
    if (json['api_key'] != null) {
      apiKey = <ApiKey>[];
      json['api_key'].forEach((v) {
        apiKey!.add(new ApiKey.fromJson(v));
      });
    }
    services = json['services'] != null
        ? new Services.fromJson(json['services'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clientInfo != null) {
      data['client_info'] = this.clientInfo!.toJson();
    }
    if (this.oauthClient != null) {
      data['oauth_client'] = this.oauthClient!.map((v) => v.toJson()).toList();
    }
    if (this.apiKey != null) {
      data['api_key'] = this.apiKey!.map((v) => v.toJson()).toList();
    }
    if (this.services != null) {
      data['services'] = this.services!.toJson();
    }
    return data;
  }
}

class ClientInfo {
  String? mobilesdkAppId;
  AndroidClientInfo? androidClientInfo;

  ClientInfo({this.mobilesdkAppId, this.androidClientInfo});

  ClientInfo.fromJson(Map<String, dynamic> json) {
    mobilesdkAppId = json['mobilesdk_app_id'];
    androidClientInfo = json['android_client_info'] != null
        ? new AndroidClientInfo.fromJson(json['android_client_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobilesdk_app_id'] = this.mobilesdkAppId;
    if (this.androidClientInfo != null) {
      data['android_client_info'] = this.androidClientInfo!.toJson();
    }
    return data;
  }
}

class AndroidClientInfo {
  String? packageName;

  AndroidClientInfo({this.packageName});

  AndroidClientInfo.fromJson(Map<String, dynamic> json) {
    packageName = json['package_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_name'] = this.packageName;
    return data;
  }
}

class OauthClient {
  String? clientId;
  int? clientType;
  AndroidInfo? androidInfo;

  OauthClient({this.clientId, this.clientType, this.androidInfo});

  OauthClient.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    clientType = json['client_type'];
    androidInfo = json['android_info'] != null
        ? new AndroidInfo.fromJson(json['android_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.clientId;
    data['client_type'] = this.clientType;
    if (this.androidInfo != null) {
      data['android_info'] = this.androidInfo!.toJson();
    }
    return data;
  }
}

class AndroidInfo {
  String? packageName;
  String? certificateHash;

  AndroidInfo({this.packageName, this.certificateHash});

  AndroidInfo.fromJson(Map<String, dynamic> json) {
    packageName = json['package_name'];
    certificateHash = json['certificate_hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_name'] = this.packageName;
    data['certificate_hash'] = this.certificateHash;
    return data;
  }
}

class ApiKey {
  String? currentKey;

  ApiKey({this.currentKey});

  ApiKey.fromJson(Map<String, dynamic> json) {
    currentKey = json['current_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_key'] = this.currentKey;
    return data;
  }
}

class Services {
  AppinviteService? appinviteService;

  Services({this.appinviteService});

  Services.fromJson(Map<String, dynamic> json) {
    appinviteService = json['appinvite_service'] != null
        ? new AppinviteService.fromJson(json['appinvite_service'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appinviteService != null) {
      data['appinvite_service'] = this.appinviteService!.toJson();
    }
    return data;
  }
}

class AppinviteService {
  List<OtherPlatformOauthClient>? otherPlatformOauthClient;

  AppinviteService({this.otherPlatformOauthClient});

  AppinviteService.fromJson(Map<String, dynamic> json) {
    if (json['other_platform_oauth_client'] != null) {
      otherPlatformOauthClient = <OtherPlatformOauthClient>[];
      json['other_platform_oauth_client'].forEach((v) {
        otherPlatformOauthClient!.add(new OtherPlatformOauthClient.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.otherPlatformOauthClient != null) {
      data['other_platform_oauth_client'] =
          this.otherPlatformOauthClient!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OtherPlatformOauthClient {
  String? clientId;
  int? clientType;
  IosInfo? iosInfo;

  OtherPlatformOauthClient({this.clientId, this.clientType, this.iosInfo});

  OtherPlatformOauthClient.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    clientType = json['client_type'];
    iosInfo = json['ios_info'] != null
        ? new IosInfo.fromJson(json['ios_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.clientId;
    data['client_type'] = this.clientType;
    if (this.iosInfo != null) {
      data['ios_info'] = this.iosInfo!.toJson();
    }
    return data;
  }
}

class IosInfo {
  String? bundleId;

  IosInfo({this.bundleId});

  IosInfo.fromJson(Map<String, dynamic> json) {
    bundleId = json['bundle_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bundle_id'] = this.bundleId;
    return data;
  }
}
