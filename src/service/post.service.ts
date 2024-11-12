import { postRepository } from '../repository/post.repository';
import { PostRequestDTO } from '../controller/dto/post-request.dto';
import { PostResponseDTO } from '../controller/dto/post-response.dto';


// Serviço responsável por gerenciar operações de post.
export class PostService {

  /**
   * Cria um novo post com os dados fornecidos.
   * É passados os parâmetros do post a ser criado.
   * Retorna o post criado.
   */
  async createPost(data: PostRequestDTO): Promise<PostResponseDTO> {
    const post = postRepository().create(data);
    await postRepository().save(post);
    return post;
  }

  // Retorna uma lista de todos os posts.
  async getPosts(): Promise<PostResponseDTO[]> {
    return postRepository().find();
  }

  // Retorna um post por ID.
  async getPostById(id: number): Promise<PostResponseDTO | null> {
    return postRepository().findOneBy({ id });
  }
}