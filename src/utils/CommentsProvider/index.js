import React, { createContext, useState } from "react";

export const CommentContext = createContext();

function CommentProvider(props) {
    const [comments, setComments] = useState([]);
    const [articleId, setArticleId] = useState(null);

    const addComment = (newComment) => {
        setComments([...comments, newComment]);
    };

    return (
        <CommentContext.Provider value={{ comments, addComment, articleId, setArticleId }}>
            {props.children}
        </CommentContext.Provider>
    );
}

export default CommentProvider;
