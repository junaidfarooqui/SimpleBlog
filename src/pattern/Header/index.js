import React, {useContext , useState, useEffect} from 'react';
import { UserContext } from "../../utils/UserProvider";

const Header = () => {
    const { user } = useContext(UserContext);
    const [currentUser, setCurrentUser ] = useState(user)
    console.log('user header', currentUser)

    useEffect(() => {
        if (user) {
            setCurrentUser(user);
        }
    }, [user]);


    const welcomeMsg = 'Welcome ' + (currentUser && currentUser.first_name + ' ' + currentUser.last_name);

    return (
        <header>
            <h1 className="text-center my-5">News Blog</h1>
            <nav>
                <ul className="px-0">
                    <li className="d-inline-block me-2"><a href="/">Home</a></li>
                    {user && <li className="d-inline-block float-end">{welcomeMsg} |
                        <a href={process.env.REACT_APP_API_ENDPOINT + '/logout.php'}>Logout</a>
                    </li>}
                    {!user && <li className="d-inline-block float-end">
                        <a href={process.env.REACT_APP_API_ENDPOINT + '/login.php'}>Login</a>
                    </li>}
                </ul>
            </nav>
        </header>
    );
};

export default Header;