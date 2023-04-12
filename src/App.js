import React from "react";
import { BrowserRouter, Routes, Route } from "react-router-dom";

import {Home, ArticlePage} from "./pattern";

import './App.css';
import {UserProvider} from "./utils/UserProvider";

function App() {

    return (
        <UserProvider>
            <div className="container">
                <BrowserRouter>
                    <Routes>
                        <Route path="/" element={<Home />} />
                        <Route path="/:slug" element={<ArticlePage />} />
                    </Routes>
                </BrowserRouter>
            </div>
        </UserProvider>
  );
}

export default App;