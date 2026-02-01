// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentResponse _$CommentResponseFromJson(Map<String, dynamic> json) =>
    CommentResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentResponseToJson(CommentResponse instance) =>
    <String, dynamic>{'data': instance.data.map((e) => e.toJson()).toList()};

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
  id: (json['id'] as num?)?.toInt(),
  actionId: (json['action_id'] as num?)?.toInt(),
  commentText: json['comment_text'] as String?,
  userId: (json['user_id'] as num?)?.toInt(),
  leadId: (json['lead_id'] as num?)?.toInt(),
  isDeleted: json['is_deleted'] as bool?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  companyId: (json['company_id'] as num?)?.toInt(),
  action: json['action'] == null
      ? null
      : LeadActionModel.fromJson(json['action'] as Map<String, dynamic>),
  commentedByUser: json['commented_by_user'] == null
      ? null
      : UsersModel.fromJson(json['commented_by_user'] as Map<String, dynamic>),
  childrenComments: (json['children_comments'] as List<dynamic>?)
      ?.map((e) => ChildComment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'action_id': instance.actionId,
      'comment_text': instance.commentText,
      'user_id': instance.userId,
      'lead_id': instance.leadId,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'company_id': instance.companyId,
    };

ChildComment _$ChildCommentFromJson(Map<String, dynamic> json) => ChildComment(
  id: (json['id'] as num?)?.toInt(),
  parentCommentId: (json['parent_comment_id'] as num?)?.toInt(),
  commentText: json['comment_text'] as String?,
  userId: (json['user_id'] as num?)?.toInt(),
  leadId: (json['lead_id'] as num?)?.toInt(),
  isDeleted: json['is_deleted'] as bool?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$ChildCommentToJson(ChildComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent_comment_id': instance.parentCommentId,
      'comment_text': instance.commentText,
      'user_id': instance.userId,
      'lead_id': instance.leadId,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
    };
