var MessageList = React.createClass({
  render: function () {
    var messageNodes = this.props.messages.map(function ( message ) {
      return <Message content={message.message.content} author={message.author} comments={message.comments}/>
    });

    return (
      <div className="message-list">
        { messageNodes }
      </div>
    )
  }
});
