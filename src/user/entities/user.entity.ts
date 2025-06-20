import {
  Column,
  Entity,
  JoinColumn,
  OneToMany,
  OneToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { UserRole } from '../enum/user-role.enum';
import { UserProfile } from './user-profile.entity';
import { BusinessProfile } from 'src/business/entities/business-profile.entity';
import { Message } from 'src/chat/entities/message.entity';
import { Conversation } from 'src/chat/entities/conversation.entity';

@Entity()
export class User {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column({ unique: true })
  email: string;

  @Column()
  password: string;

  @Column({ type: 'enum', enum: UserRole, default: UserRole.USER })
  role: UserRole;

  @OneToOne(() => UserProfile, (profile) => profile.user, {
    cascade: true,
    eager: true,
  })
  @JoinColumn()
  profile: UserProfile;

  @OneToOne(() => BusinessProfile, (business) => business.user, {
    nullable: true,
  })
  businessProfile: BusinessProfile;

  @OneToMany(() => Message, (message) => message.sender)
  messagesSent: Message[];

  @OneToMany(() => Message, (message) => message.receiver)
  messagesReceived: Message[];

  @OneToMany(() => Conversation, (c) => c.user1)
  conversationAsUser1: Conversation[];

  @OneToMany(() => Conversation, (c) => c.user2)
  conversationAsUser2: Conversation[];
}
