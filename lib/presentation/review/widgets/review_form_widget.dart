import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../assets/assets.gen.dart';

class ReviewFormWidget extends StatelessWidget {
  const ReviewFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildProfile(context),
          _buildRatingBar(context),
          _buildTextFieldComment(context)
        ],
      ),
    );
  }

  Widget _buildRatingBar(BuildContext context) {
    return RatingBar.builder(
      initialRating: 0,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 48,
      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      unratedColor: context.appColors.outline,
      onRatingUpdate: (rating) {},
      ignoreGestures: false,
    ).paddingTopSpace(SpaceType.medium);
  }

  Widget _buildProfile(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: context.appColors.surface,
          child: ClipOval(
            child: SizedBox(
              width: 56,
              height: 56,
              child: CachedNetworkImage(
                imageUrl: "https://thispersondoesnotexist.com",
                errorWidget: (context, url, error) => CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(Assets.icAvatar.path),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ).paddingRightSpace(SpaceType.medium),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nguyen Duy Trang",
              style: context.appTextStyles.titleMedium.bold
                  .copyWith(color: context.appColors.onSurface),
            ),
            Text(
              "Reviews are public and include your account and \ndevice info. Learn more",
              style: context.appTextStyles.labelMedium
                  .copyWith(color: context.appColors.onSurface),
              overflow: TextOverflow.ellipsis, // Ensures text doesn't overflow
              maxLines: 2, // Limits text to 2 lines, adjust as needed
            ),
          ],
        )
      ],
    );
  }

  Widget _buildTextFieldComment(BuildContext context) {
    return TextFormField(
      maxLines: null,
      maxLength: 500,
      style: context.appTextStyles.labelLarge
          .copyWith(color: context.appColors.onSurface),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: context.appColors.outline, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      ),
    ).paddingTopSpace(SpaceType.medium);
  }
}
