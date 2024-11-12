import { userRepository } from '../repository/user.repository';
import { UserRequestDTO } from '../controller/dto/user-request.dto';
import { UserResponseDTO } from '../controller/dto/user-response.dto';


// Serviço responsável por gerenciar operações de usuário.
export class UserService {

  /**
   * Cria um novo usuário com os dados fornecidos.
   * É passados os parâmetros do usuário a ser criado.
   * Retorna o usuário criado.
   */
  async createUser(data: UserRequestDTO): Promise<UserResponseDTO> {
    const user = userRepository().create(data);
    await userRepository().save(user);
    return user;
  }

  // Retorna uma lista de todos os usuários.
  async getUsers(): Promise<UserResponseDTO[]> {
    return userRepository().find();
  }

  // Retorna um usuário por ID.
  async getUserById(id: number): Promise<UserResponseDTO | null> {
    return userRepository().findOneBy({ id });
  }
}