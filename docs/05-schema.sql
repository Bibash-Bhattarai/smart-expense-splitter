CREATE TABLE users(
  userId INT PRIMARY KEY AUTO_INCREMENT,
  userName VARCHAR(40) UNIQUE,
  email VARCHAR(40) UNIQUE,
  password VARCHAR(255)
);

CREATE TABLE groups(
  groupId INT PRIMARY KEY AUTO_INCREMENT,
  groupName VARCHAR(30),
  createdBy INT,
  FOREIGN KEY(createdBy) REFERENCES users(userId) ON DELETE RESTRICT
);

CREATE TABLE groupMember(
  groupMemberId INT PRIMARY KEY AUTO_INCREMENT,
  userId INT,
  groupId INT,
  role VARCHAR(20),
  FOREIGN KEY(groupId) REFERENCES groups(groupId) ON DELETE RESTRICT,
  FOREIGN KEY(userId) REFERENCES users(userId) ON DELETE RESTRICT,
  UNIQUE (userId, groupId)
);

CREATE TABLE expense(
  expenseId INT PRIMARY KEY AUTO_INCREMENT,
  groupId INT,
  paidBy INT,
  amount DECIMAL(10,2),
  description VARCHAR(255),
  transactionDate DATE,
  splitType VARCHAR(20),
  FOREIGN KEY(groupId) REFERENCES groups(groupId) ON DELETE RESTRICT,
  FOREIGN KEY(paidBy) REFERENCES users(userId) ON DELETE RESTRICT,
  INDEX(groupId)
);

CREATE TABLE expenseSplit(
  expenseSplitId INT PRIMARY KEY AUTO_INCREMENT,
  userId INT,
  expenseId INT,
  amountOwed DECIMAL(10,2),
  FOREIGN KEY(expenseId) REFERENCES expense(expenseId) ON DELETE RESTRICT,
  FOREIGN KEY(userId) REFERENCES users(userId) ON DELETE RESTRICT,
  UNIQUE (userId, expenseId),
  INDEX(expenseId)
);

CREATE TABLE settlement(
  settlementId INT PRIMARY KEY AUTO_INCREMENT,
  groupId INT,
  payerId INT,
  receiverId INT,
  amount DECIMAL(10,2),
  transactionDate DATE,
  FOREIGN KEY(groupId) REFERENCES groups(groupId) ON DELETE RESTRICT,
  FOREIGN KEY(payerId) REFERENCES users(userId) ON DELETE RESTRICT,
  FOREIGN KEY(receiverId) REFERENCES users(userId) ON DELETE RESTRICT
);