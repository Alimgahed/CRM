import 'package:crm/features/actions/data/model/lead_action_model.dart';
import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CommentResponse {
  final List<CommentModel> data;

  CommentResponse({required this.data});

  factory CommentResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommentResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CommentModel {
  final int? id;

  @JsonKey(name: 'action_id')
  final int? actionId;

  @JsonKey(name: 'comment_text')
  final String? commentText;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'lead_id')
  final int? leadId;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'company_id')
  final int? companyId;

  // 🔥 KEY FIX: These fields should NOT be included when sending to API
  @JsonKey(includeToJson: false)
  final LeadActionModel? action;

  @JsonKey(name: 'commented_by_user', includeToJson: false)
  final UsersModel? commentedByUser;

  @JsonKey(name: 'children_comments', includeToJson: false)
  final List<ChildComment>? childrenComments;

  CommentModel({
    this.id,
    this.actionId,
    this.commentText,
    this.userId,
    this.leadId,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.companyId,
    this.action,
    this.commentedByUser,
    this.childrenComments,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);

  // 🔥 ALTERNATIVE: Custom toJson for creating comments
  Map<String, dynamic> toJsonForCreate() {
    return {
      if (leadId != null) 'lead_id': leadId,
      if (commentText != null) 'comment_text': commentText,
      if (actionId != null) 'action_id': actionId,
      if (userId != null) 'user_id': userId,
      // Don't include: id, action, commentedByUser, childrenComments
    };
  }
}

@JsonSerializable()
class ChildComment {
  final int? id;

  @JsonKey(name: 'parent_comment_id')
  final int? parentCommentId;

  @JsonKey(name: 'comment_text')
  final String? commentText;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'lead_id')
  final int? leadId;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  ChildComment({
    this.id,
    this.parentCommentId,
    this.commentText,
    this.userId,
    this.leadId,
    this.isDeleted,
    this.createdAt,
  });

  factory ChildComment.fromJson(Map<String, dynamic> json) =>
      _$ChildCommentFromJson(json);

  Map<String, dynamic> toJson() => _$ChildCommentToJson(this);
}
