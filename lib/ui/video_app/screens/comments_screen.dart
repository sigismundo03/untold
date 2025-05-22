import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untold/ui/core/widgets/exports.dart';

import '../../../domain/model/comment_model.dart';
import '../../core/di/injection.dart';
import '../view_model/comment_view_model.dart';
import '../widgets/comment_widget.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key, required this.moveId});
  final int moveId;

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final CommentViewModel _viewModel = getIt<CommentViewModel>();
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _viewModel.getUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios,
                        color: Color.fromRGBO(170, 115, 240, 1)),
                    onPressed: () async {
                      await SystemChrome.setPreferredOrientations([
                        DeviceOrientation.landscapeRight,
                        DeviceOrientation.landscapeLeft,
                      ]);
                      Navigator.pop(context);
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  Text(
                    'Fuzzy Head',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                '324 Comments',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: StreamBuilder<List<CommentModel>>(
                stream: _viewModel.getComments(widget.moveId),
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
                          timeAgo:comment.timeAgoFromString(comment.date),
                          comment: comment.comment ??
                              "Lorem ipsum dolor sit amet. Nulla mollis gravida faucibus sollicitudin ut tincidunt.",
                          hasReplies: true,
                          replyCount: 12,
                        );
                      });
                }),
          ),
          Observer(builder: (context) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      radius: 16,
                      child: _viewModel.user.photoUrl != null
                          ? CacheImageWidget(
                              assetName: _viewModel.user.photoUrl!,
                              height: 37,
                              width: 37,
                            )
                          : Text("E")),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: PrimaryTextFieldWidget(
                    controller: _commentController,
                    hintText: 'Add a reply...',
                    onChanged: (value) {
                      _viewModel.comment = value;
                    },
                  ),
                ),
                SizedBox(width: 10),
                if (_viewModel.comment.isNotEmpty)
                  GestureDetector(
                      onTap: () {
                        _viewModel.salveComment(
                            widget.moveId, _commentController.text);
                        _commentController.clear();
                        _viewModel.comment = '';
                      },
                      child: SvgPicture.asset(
                        'assets/send.svg',
                        width: 24,
                        height: 24,
                      )),
                SizedBox(width: 10),
              ],
            );
          }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
