import React, { useEffect, useContext } from 'react';
import axios from 'axios';
import { CommentContext } from "../../utils/CommentsProvider";

function CommentsList({ articleId, onReply }) {
    const { comments, addComment } = useContext(CommentContext);

    useEffect(() => {
        // Fetch comments based on articleId
        axios.post(process.env.REACT_APP_API_ENDPOINT + `/api/comments?articleId=${articleId}`)
            .then(response => addComment(response.data))
            .catch(error => console.error(error));
    }, [articleId]);

    const handleReplyClick = (commentId) => {
        onReply(commentId);
    };

    const flattenedComments = comments.flat()

    return (
        <>
            <h1 className="mb-3 mt-5">Comments</h1>
            {Array.isArray(flattenedComments) && flattenedComments[0] !== null && flattenedComments.map(comment => (
                <>
                <div className="card mb-5" key={comment.id}>
                    <div className="card-header">{comment.headline}</div>
                    <div className="card-body pt-3">
                        {comment.content}
                    </div>
                    <div className="card-footer">
                        By: {comment.name}
                        <a href="javascript:;" className="justify-content-end float-end" onClick={() => handleReplyClick(comment.id)}>Reply</a>
                    </div>
                </div>
            {/* Render replies */}
            {comment.replies && comment.replies.length > 0 &&
                <div className="card-body pe-0 ps-5">
                {comment.replies.map(reply => (
                    <div className="card mb-3" key={reply.id}>
                        <div className="card-header">{reply.headline}</div>
                        <div className="card-body pt-3">
                            {reply.content}
                        </div>
                        <div className="card-footer">
                            By: {reply.name}
                        </div>
                    </div>
                ))}
                </div>
            }</>
            ))}

        </>
    );
}

export default CommentsList;
