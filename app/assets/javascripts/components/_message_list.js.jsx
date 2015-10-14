var MessageList = React.createClass({
  render: function () {
    var messageNodes = this.props.messages.map(function ( message ) {
      return <Message content={ message.content } author={message.author}  author_id={message.author_id} />
    });

    return (
      <div className="message-list">
        { messageNodes }
      </div>
    )
  }
});
