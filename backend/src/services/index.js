import axios from 'axios';

const fetchData = async ({ url }) => {
    const response = await axios.get(`https://jsonplaceholder.typicode.com/${url}`);
    return response.data;
};

export default { fetchData };