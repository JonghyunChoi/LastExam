package com.it.spring.service;

import com.it.spring.dao.ISellGameDAO;
import com.it.spring.dao.ISoldGameDAO;
import com.it.spring.dto.SoldGameDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import java.util.List;

@Service
public class BuyGameService implements IBuyGameService {

    @Autowired
    ISellGameDAO sellGameDAO;
    @Autowired
    ISoldGameDAO soldGameDAO;

    @Autowired
    TransactionTemplate transactionTemplate;

    @Override
    public void buy(String name, int price, int number) {

        try {
            transactionTemplate.execute(new TransactionCallbackWithoutResult() {
                @Override
                protected void doInTransactionWithoutResult(TransactionStatus status) {
                    List<SoldGameDTO> overlap = soldGameDAO.soldListGetOne(name);

                    if(overlap.size() == 0) {
                        sellGameDAO.sell(name);
                        soldGameDAO.insertList(name, price, 1);
                    } else if(number > 0) {
                        sellGameDAO.sell(name);
                        soldGameDAO.updateList(name);
                    }

                }
            });

        } catch (Exception e) {
            System.out.println("Rollback");
        }
    }

    @Override
    public void refund(String name, int number) {
        try {
            transactionTemplate.execute(new TransactionCallbackWithoutResult() {
                @Override
                protected void doInTransactionWithoutResult(TransactionStatus status) {
                    int num = number;
                    soldGameDAO.refundList(name);

                    if(number > 0) {
                        sellGameDAO.refund(name);
                        num -= 1;

                        if(num == 0) soldGameDAO.deleteList(name);
                    }
                }
            });

        } catch (Exception e) {
            System.out.println("Rollback");
        }
    }
}
