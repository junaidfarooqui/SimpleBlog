import React, { useState, useEffect } from 'react';
import axios from 'axios';
import Pagination from "./Pagination";

const ArticleList = () => {
    const [articles, setArticles] = useState([]);
    const [page, setPage] = useState(1);
    const [perPage, setPerPage] = useState(5);
    const [totalPages, setTotalPages] = useState(1);

    const fetchArticles = async () => {
        await axios.get(process.env.REACT_APP_API_ENDPOINT + `/api/articles?page=${page}&perPage=${perPage}`)
            .then(response => {
                setArticles(response.data.articles);
                console.log(response)
                setTotalPages(Math.ceil(response.data.total_records / perPage));
                //console.log('sss', Math.ceil(response.data.articles.length))
            })
            .catch(error => console.error(error));
    };

    useEffect(() => {
        fetchArticles();
        console.log('articles', articles)
    }, [page, perPage]);

    const handlePageChange = (newPage) => {
        setPage(newPage);
    };

    return (
        <>
            <div className="row mt-5">
                {articles.map((article) => (
                    <div className="col-12 col-lg-4" key={article.id}>
                        <div className="card pt-4">
                            <div className="card-body">
                                <h3 className="mb-2">
                                    <a href={article.slug}>
                                        {article.title.substring(0, 50)}
                                    </a>
                                </h3>
                                <ul className="ms-0 ps-0 d-flex">
                                    <li className="w-50">By: {article.author_name}</li>
                                    <li className="text-end w-50">Date: {article.date_created}</li>
                                </ul>
                                <div className="featured-image mb-3">
                                    <img className="w-100" src={article.image_url} alt={article.title} />
                                </div>
                                <div dangerouslySetInnerHTML={{ __html: article.content.substring(0, 120) }}></div>
                            </div>
                        </div>
                    </div>
                ))}
            </div>

            <div className="col-lg-12 text-center my-5">
                <Pagination currentPage={page} totalPages={totalPages} onPageChange={handlePageChange} />
            </div>
        </>
    );

};

export default ArticleList;
