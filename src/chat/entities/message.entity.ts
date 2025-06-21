import {
  Column,
  CreateDateColumn,
  Entity,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Conversation } from './conversation.entity';
import { User } from 'src/user/entities/user.entity';

export enum MessageType {
  TEXT = 'TEXT',
  IMAGE = 'IMAGE',
  AUDIO = 'AUDIO',
  STICKER = 'STICKER',
  VIDEO = 'VIDEO',
}

@Entity()
export class Message {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @ManyToOne(() => Conversation, (conversation) => conversation.messages)
  conversation: Conversation;

  @ManyToOne(() => User, (user) => user.messagesSent)
  sender: User;

  @ManyToOne(() => User, (user) => user.messagesReceived)
  receiver: User;

  @Column({ type: 'enum', enum: MessageType })
  type: MessageType;

  @Column({ type: 'text', nullable: true })
  content: string;

  @Column({ nullable: true })
  imageUrl?: string;

  @Column({ nullable: true })
  audioUrl?: string;

  @Column({ nullable: true })
  stickerUrl?: string;

  @Column({ nullable: true })
  videoUrl?: string;

  @Column({ default: false })
  isRead: boolean;

  @CreateDateColumn()
  createdAt: Date;
}
