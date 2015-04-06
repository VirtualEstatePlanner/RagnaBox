/*
 * File:   char_logif.h
 * Author: lighta
 *
 * Created on June 15, 2013, 12:05 PM
 */

#ifndef CHAR_LOGIF_H
#define	CHAR_LOGIF_H

#include "char.h"

#ifdef	__cplusplus
extern "C" {
#endif

int chlogif_pincode_notifyLoginPinError( uint32 account_id );
int chlogif_pincode_notifyLoginPinUpdate( uint32 account_id, char* pin );
void chlogif_pincode_start(int fd, struct char_session_data* sd);
int chlogif_send_acc_tologin(int tid, unsigned int tick, int id, intptr_t data);
int chlogif_broadcast_user_count(int tid, unsigned int tick, int id, intptr_t data);
int chlogif_send_usercount(int users);
int chlogif_save_accreg2(unsigned char* buf, int len);
int chlogif_request_accreg2(uint32 account_id, uint32 char_id);
int chlogif_send_reqaccdata(int fd, struct char_session_data *sd);
int chlogif_send_setacconline(int aid);
void chlogif_send_setallaccoffline(int fd);
int chlogif_send_setaccoffline(int fd, int aid);
int chlogif_parse_ackconnect(int fd, struct char_session_data* sd);
int chlogif_parse_ackaccreq(int fd, struct char_session_data* sd);
int chlogif_parse_reqaccdata(int fd, struct char_session_data* sd);
int chlogif_parse_keepalive(int fd, struct char_session_data* sd);
int chlogif_parse_ackchangesex(int fd, struct char_session_data* sd);
int chlogif_parse_ackacc2req(int fd, struct char_session_data* sd);
int chlogif_parse_accbannotification(int fd, struct char_session_data* sd);
int chlogif_parse_askkick(int fd, struct char_session_data* sd);
int chlogif_parse_updip(int fd, struct char_session_data* sd);

int chlogif_BankingReq(int32 account_id, int8 type, int32 data);
int chlogif_parse_BankingAck(int fd);
int chlogif_parse_vipack(int fd);
int chlogif_reqvipdata(uint32 aid, uint8 type, int32 timediff, int mapfd);
int chlogif_req_accinfo(int fd, int u_fd, int u_aid, int u_group, int account_id, int8 type);

int chlogif_parse(int fd);

int chlogif_isconnected();
int chlogif_check_connect_logserver(int tid, unsigned int tick, int id, intptr_t data);
void do_init_chlogif(void);
void chlogif_reset(void);
void chlogif_check_shutdown(void);
void chlogif_on_disconnect(void);
void chlogif_on_ready(void);
void do_final_chlogif(void);


#define loginif_check(a) { if(!chlogif_isconnected()) return a; }

#ifdef	__cplusplus
}
#endif

#endif	/* CHAR_LOGIF_H */

