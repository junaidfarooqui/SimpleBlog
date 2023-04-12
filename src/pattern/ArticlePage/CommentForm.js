import React, {useContext, useState, useEffect} from 'react';
import axios from 'axios';
import { UserContext } from '../../utils/UserProvider'
import { CommentContext } from "../../utils/CommentsProvider";

function CommentForm(props) {
    const { articleId, referenceId } = props

    const { user } = useContext(UserContext);
    const { addComment } = useContext(CommentContext);


    const {id , first_name, last_name, email} = user
    const isUser = user.status !== 'error'

    const [name, setName] = useState('');
    const [headline, setHeadline] = useState('');
    const [inputEmail, setInputEmail] = useState('');
    const [content, setContent] = useState('');
    const [loading, setLoading] = useState(false);
    const [successMsgShow, setSuccessMsgShow] = useState(false);

    useEffect(()=> {
        if(isUser) {
            setName(first_name + ' ' + last_name)
            setInputEmail(email)
        }
    }, [])

    const handleSubmit = async (event) => {
        event.preventDefault();
        setLoading(true)
        const status = isUser ? 'approved' : 'pending';

        const data = { name, headline, inputEmail, content, id, status, articleId, referenceId };
        await axios.post(process.env.REACT_APP_API_ENDPOINT + '/api/comments', JSON.stringify(data))
            .then(response => {
                if (response.data.status === 'ok' && isUser) {
                    addComment(response.data.message)
                    successAction()
                } else {
                    successAction()
                }
            })
            .catch(error => {
                console.error(error);
            });
    };

    const successAction = ()=> {
        setSuccessMsgShow(true)
        setHeadline('');
        setContent('');
        setLoading(false);
        if (!isUser) {
            setName('');
            setInputEmail('')
        }

        setTimeout(()=> {
            setSuccessMsgShow(false)
        }, 5000)
    }

    return (
        <form className="row my-5" onSubmit={handleSubmit}>
            <input type="hidden" name="author_id" value={id} />
            <input type="hidden" name="article_id" value={articleId} />
            <input type="hidden" name="reference_id" value={referenceId} />

            <div className="col-12 col-lg-4 mb-3">
                <label className="mb-1">Name:</label>
                <input
                    className="form-control"
                    type="text"
                    value={name}
                    onChange={(event) => setName(event.target.value)}
                    disabled={isUser}
                    required={true}
                />

            </div>
            <div className="col-12 col-lg-4">
                <label className="mb-1">Headline:</label>
                <input
                    className="form-control"
                    type="text"
                    value={headline}
                    onChange={(event) => setHeadline(event.target.value)}
                    required={true}
                />
            </div>
            <div className="col-12 col-lg-4">
                <label className="mb-1">Email:</label>
                <input
                    className="form-control"
                    type="email"
                    value={inputEmail}
                    onChange={(event) => setInputEmail(event.target.value)}
                    disabled={isUser}
                    required={true}
                />
            </div>
            <div className="col-12 mb-3">
                <label className="mb-1">Content:</label>
                <textarea
                    className="form-control"
                    value={content}
                    onChange={(event) => setContent(event.target.value)}
                    required={true}
                ></textarea>
            </div>
            <div className="col-12 text-end">
                <button className="btn btn-primary float-end" type="submit">Submit</button>
                {loading && <div className="justify-content-center float-end me-4">
                    <div className="spinner-border" role="status">
                        <span className="visually-hidden">Loading...</span>
                    </div>
                </div>}
                <br/>
                <br/>
                {successMsgShow && isUser && <div className="alert alert-success alert-dismissible text-start fade show" role="alert">
                    Your comment successfully submitted!
                </div>}
                {successMsgShow && !isUser && <div className="alert alert-success alert-dismissible text-start fade show" role="alert">
                    Your comment successfully submitted with status pending. Admin will review approved it as soon as possible!
                </div>}
            </div>
        </form>
    );
}

export default CommentForm;
