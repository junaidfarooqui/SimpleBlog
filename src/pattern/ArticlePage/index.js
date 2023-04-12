import React, {useState, useEffect, useRef} from 'react';
import { useParams } from 'react-router-dom';
import {Header} from "../index";
import CommentForm from "./CommentForm";
import CommentsList from "./CommentsList";
import CommentProvider from "../../utils/CommentsProvider";

function ArticlePage() {
    const [article, setArticle] = useState(null);
    const [referenceId, setReferenceId] = useState(null);
    const commentFormRef = useRef(null);

    const handleReply = (commentId) => {
        setReferenceId(commentId);
        if (commentFormRef.current) {
            commentFormRef.current.scrollIntoView({ behavior: 'smooth' });
        }
    };

    const { slug } = useParams();

    useEffect(() => {
        fetch(`http://localhost:8888/NewsBlog/api/articles?slug=${slug}`)
            .then(res => res.json())
            .then(data => setArticle(data));
    }, [slug]);

    if (!article) {
        return <div className="d-flex justify-content-center">
            <div className="spinner-border" role="status">
                <span className="visually-hidden">Loading...</span>
            </div>
        </div>;
    }

    return (
        <>
            <Header/>
            <div className="row article-detail">
                <div className="col-12 col-lg-9">
                    <h1>{article.title}</h1>
                    <ul className="meta-box">
                        <li><strong>Author:</strong> {article.author_name}</li>
                        <li><strong>Date:</strong> {article.date_created}</li>
                        <li><strong>Categories:</strong> {article.categories}</li>
                    </ul>
                    <div dangerouslySetInnerHTML={{ __html: article.content }}></div>
                    <CommentProvider value={{ articleId : article.id}}>
                        <CommentsList
                            articleId={article.id}
                            onReply={handleReply} />
                        <div ref={commentFormRef}>
                            <CommentForm
                                articleId={article.id}
                                referenceId={referenceId}
                            />
                        </div>
                    </CommentProvider>
                </div>
                <div className="col-12 col-lg-3">
                    <h2>I am sidebar</h2>
                </div>

            </div>
        </>
    );
}

export default ArticlePage