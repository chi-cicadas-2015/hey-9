var MessageList = React.createClass({
  render: function () {
    var messageNodes = this.props.messages.map(function ( message ) {
      return <Message message={ message } />
    });

    return (
      <div className="message-list">
        { messageNodes }
      </div>
    )
  }
});
