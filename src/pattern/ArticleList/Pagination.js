import React from 'react';

const maxPageButtons = 5; // Maximum number of page buttons to show at once

function Pagination({ currentPage, totalPages, onPageChange }) {
    // Calculate the range of page buttons to show
    let startPage = Math.max(1, currentPage - Math.floor(maxPageButtons / 2));
    let endPage = Math.min(totalPages, startPage + maxPageButtons - 1);
    startPage = Math.max(1, endPage - maxPageButtons + 1);

    // Generate an array of page numbers to show
    const pageNumbers = Array.from({ length: endPage - startPage + 1 }, (_, i) => startPage + i);

    // Event handler for clicking a page button
    const handleClick = (pageNumber) => {
        onPageChange(pageNumber);
    };

    return (
        <nav aria-label="Page navigation">
            <ul className="pagination justify-content-center">
                <li className="page-item">
                    <button onClick={() => handleClick(currentPage - 1)} disabled={currentPage === 1} className="page-link" href="javascript:;" aria-label="Previous">
                        <span aria-hidden="true">«</span>
                    </button>
                </li>
                {pageNumbers.map((pageNumber) => (
                    <li key={pageNumber} onClick={() => handleClick(pageNumber)} className={pageNumber === currentPage ? 'page-item active' : 'page-item'} className="page-item"><a className="page-link" href="#">{pageNumber}</a></li>
                ))}
                <li className="page-item">
                    <button onClick={() => handleClick(currentPage + 1)} disabled={currentPage === totalPages} className="page-link" href="javascript:;" aria-label="Next">
                        <span aria-hidden="true">»</span>
                    </button>
                </li>
            </ul>
        </nav>
    );
}

export default Pagination;
