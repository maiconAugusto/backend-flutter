import express from 'express';
import { loadUserPosts, loadUsers } from '../controllers/users.js';

const router = express.Router();

router.get('/users', loadUsers);
router.get('/user-posts/:id', loadUserPosts);

export default router;