//
//  ALTChatViewController.swift
//  Alternative
//
//  Created by Ravi Ranjan on 12/06/16.
//  Copyright © 2016 Mackerov Technogies Pvt Ltd. All rights reserved.
//

import UIKit
import JSQMessagesViewController
import PubNub

class ALTChatViewController: JSQMessagesViewController {
    
    //Mark:-Types
    var titleText:String!
    
    //MARK:-Properties
    var messages = [JSQMessage]()
    var outgoingBubbleImageView: JSQMessagesBubbleImage!
    var incomingBubbleImageView: JSQMessagesBubbleImage!
    let outGoingColor = UIColor(red: 235/255, green: 161/255, blue: 14/255, alpha: 1.0)
    let incomingColor = UIColor(red: 199/255, green: 191/255, blue: 175/255, alpha: 1.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearance()
        setupBubbles()
        collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSizeZero
        collectionView!.collectionViewLayout.outgoingAvatarViewSize = CGSizeZero
        self.title = titleText
        self.senderId = "codewithrabbit@gmail.com"
        self.senderDisplayName = "Ravi Ranjan"
        
    }
    func appearance(){
        let borderColor = UIColor(red: 144/255, green: 38/255, blue: 25/255, alpha: 1.0)
        inputToolbar.contentView.textView.layer.borderColor = borderColor.CGColor
        inputToolbar.contentView.textView.layer.borderWidth = 2.0
    }
    private func setupBubbles() {
        let factory = JSQMessagesBubbleImageFactory()
        outgoingBubbleImageView = factory.outgoingMessagesBubbleImageWithColor(
            outGoingColor)
        incomingBubbleImageView = factory.incomingMessagesBubbleImageWithColor(
            incomingColor)
    }
    
    
    func addMessage(id: String, text: String) {
        let message = JSQMessage(senderId: id, displayName: "", text: text)
        messages.append(message)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        observeMessages()
        
        // messages from someone else
        addMessage("Ravi", text: "Hey Tulsi!")
        // messages sent from local sender
        addMessage(senderId, text: "sup!")
        addMessage(senderId, text: "How u doin!")
        // animates the receiving of a new message on the view
        finishReceivingMessage()
    }
    
    
    override func collectionView(collectionView: UICollectionView,
                                 cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath)
            as! JSQMessagesCollectionViewCell
        
        let message = messages[indexPath.item]
        
        if message.senderId == senderId {
            cell.textView!.textColor = UIColor.whiteColor()
        } else {
            cell.textView!.textColor = UIColor.blackColor()
        }
        
        return cell
    }
    
    
    override func collectionView(collectionView: JSQMessagesCollectionView!,
                                 messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
        let message = messages[indexPath.item]
        if message.senderId == senderId {
            return outgoingBubbleImageView
        } else {
            return incomingBubbleImageView
        }
    }
    
    
    override func collectionView(collectionView: JSQMessagesCollectionView!,
                                 avatarImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!,
                                 messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
        addMessage(senderId, text: text)
        JSQSystemSoundPlayer.jsq_playMessageSentSound()
        finishSendingMessage()
    }
    override func didPressAccessoryButton(sender: UIButton!) {
        print("Left Button Pressed")
    }
    
    private func observeMessages() {
        
    }
    
    override func textViewDidChange(textView: UITextView) {
        super.textViewDidChange(textView)
    }
}
