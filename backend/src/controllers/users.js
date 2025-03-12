import services from '../services/index.js'

export const loadUsers = async (_request, response) => {
  try {
    const data = await services.fetchData({ url: 'users' });
    return response.status(200).json(data);
  } catch (error) {
    return response.status(400).json({ error: 'Erro ao listar os usuários' });
  }
}

export const loadUserPosts = async (request, response) => {
  try {
    const { id: userId } = request.params;

    const data = await services.fetchData({ url: 'posts' });
    const posts = data.filter((post) => post.userId === Number(userId));
    return response.status(200).json(posts);
  } catch (error) {
    return response.status(400).json({ error: 'Erro ao listar posts' });
  }
}