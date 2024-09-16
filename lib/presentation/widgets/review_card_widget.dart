import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../assets/assets.gen.dart';
import '../../core/utility/space_utils.dart';
import '../../domain/entities/review/review_entity.dart';

class ReviewCardWidget extends StatelessWidget {
  final ReviewEntity reviewEntity;
  const ReviewCardWidget({super.key, required this.reviewEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.appColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildAvatar(context, "https://thispersondoesnotexist.com"),
              const SizedBox(
                width: 10,
              ),
              _buildTitle(context, reviewEntity.userId, reviewEntity.rating),
            ],
          ),
          _buildComment(context, reviewEntity.comment)
              .paddingTopSpace(SpaceType.medium),
        ],
      ),
    );
  }

  Widget _buildAvatar(BuildContext context, String url) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: context.appColors.surface,
      child: ClipOval(
        child: SizedBox(
          width: 44,
          height: 44,
          child: CachedNetworkImage(
            imageUrl: url,
            errorWidget: (context, url, error) => CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(Assets.icAvatar.path),
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, String userId, int rating) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              userId,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.appTextStyles.labelLarge.bold
                  .copyWith(color: context.appColors.onSurface),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            "★ $rating",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.appTextStyles.labelLarge.bold
                .copyWith(color: context.appColors.primary),
          ),
        ],
      ),
    );
  }

  Widget _buildComment(BuildContext context, String comment) {
    return Text(
      comment,
      style: context.appTextStyles.labelMedium
          .copyWith(color: context.appColors.onSurface),
    );
  }
}
