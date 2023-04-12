import axios from "axios";
import React, { createContext, useEffect, useState } from 'react';

const UserContext = createContext();

const UserProvider = ({ children }) => {
    const [user, setUser] = useState(null);

    useEffect(() => {
        const getCurrentUser = async () => {
            try {
                const response = await axios.get(process.env.REACT_APP_API_ENDPOINT + '/api/users', { withCredentials: true });
                setUser(response.data)
            } catch (error) {
                console.error(error);
            }
        };
        getCurrentUser();
    }, []); // Add setUser as a dependency of useEffect

    return (
        <UserContext.Provider value={{ user, setUser }}>
            {children}
        </UserContext.Provider>
    );
};

export { UserContext, UserProvider };
