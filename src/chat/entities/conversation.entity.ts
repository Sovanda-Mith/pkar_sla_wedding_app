import { User } from 'src/user/entities/user.entity';
import { Entity, ManyToOne, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { Message } from './message.entity';

@Entity()
export class Conversation {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @ManyToOne(() => User, (user) => user.conversationAsUser1)
  user1: User;

  @ManyToOne(() => User, (user) => user.conversationAsUser2)
  user2: User;

  @OneToMany(() => Message, (message) => message.conversation)
  messages: Message[];
}
