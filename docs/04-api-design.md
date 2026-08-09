# API Design for group

POST   /groups                              — create a group
GET    /groups                              — list groups the current user belongs to
GET    /groups/{groupId}                    — view one group
POST   /groups/{groupId}/members             — add a member (self-join or admin-add)
DELETE /groups/{groupId}/members/{userId}    — remove a member (self-leave or admin-remove)

# API Design for expense

POST   /expenses                    — create an expense (body varies by splitType, as above)
GET    /expenses/{expenseId}        — view one expense
GET    /groups/{groupId}/expenses   — list all expenses for a group
PUT    /expenses/{expenseId}        — edit an expense
DELETE /expenses/{expenseId}        — delete an expense

# Settlement endpoints

POST   /settlements                    — record a settlement (append-only)
GET    /settlements/{settlementId}     — view one settlement
GET    /groups/{groupId}/settlements   — list settlements for a group

# Final Balance/Debt endpoints

GET /groups/{groupId}/balances   — raw per-person balances (owes/owed)
GET /groups/{groupId}/debts      — simplified minimum-payment plan
