import 'package:flutter/material.dart';
import 'package:untold/domain/model/comment_model.dart';
import 'package:untold/ui/core/widgets/exports.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
    required this.height,
    required this.width,
    this.onPressedClose,
    required this.moveId,
    required this.commentsStream,
    this.onTapTextField,
  });
  final double height;
  final double width;
  final Function()? onPressedClose;
  final int moveId;
  final Stream<List<CommentModel>> commentsStream;
  final void Function()? onTapTextField;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.black,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '324 Comments',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SecondaryButtonWidget(
                text: 'Close',
                onPressed: onPressedClose,
              ),
            ],
          ),
          const SizedBox(height: 16),

          Expanded(
            child: StreamBuilder<List<CommentModel>>(
                stream: commentsStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('Nenhum comentário ainda.'));
                  }

                  final comments = snapshot.data!;
                  comments.sort(
                    (a, b) => b.date!.compareTo(a.date!),
                  );
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        final comment = comments[index];
                        return CommentItemWidget(
                          profileImage: CircleAvatar(
                              radius: 12,
                              child: comment.user?.photoUrl != null
                                  ? CacheImageWidget(
                                      assetName: comment.user!.photoUrl!,
                                      height: 37,
                                      width: 37,
                                    )
                                  : Text("E")),
                          name: comment.user?.name ?? "Eva Mendes",
                          timeAgo: comment.timeAgoFromString(comment.date),
                          comment: comment.comment ??
                              "Lorem ipsum dolor sit amet. Nulla mollis gravida faucibus sollicitudin ut tincidunt.",
                          hasReplies: true,
                          replyCount: 12,
                        );
                      });
                }),
          ),

          // Campo de resposta
          Row(
            children: [
              CircleAvatar(radius: 16, backgroundColor: Colors.grey),
              SizedBox(width: 10),
              Expanded(
                child: PrimaryTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: 'Add a reply...',
                  onTap: onTapTextField,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CommentItemWidget extends StatelessWidget {
  final Widget profileImage;
  final String name;
  final String timeAgo;
  final String comment;
  final bool hasReplies;
  final int replyCount;

  const CommentItemWidget({
    super.key,
    required this.profileImage,
    required this.name,
    required this.timeAgo,
    required this.comment,
    this.hasReplies = false,
    this.replyCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        profileImage,
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$name ',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              Text(
                ' $timeAgo',
                style: const TextStyle(
                  color: Color(0xffC4C4C4),
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 4),
              Text(comment, style: const TextStyle(color: Colors.white)),
              if (hasReplies)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SecondaryButtonWidget(
                      text: '▼ View $replyCount replies',
                      onPressed: () {},
                      fontSize: 12,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    const Text(
                      'REPLY',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        const Icon(Icons.more_vert, color: Colors.white38),
      ],
    );
  }
}
