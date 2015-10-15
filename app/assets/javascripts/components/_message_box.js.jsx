var MessageBox = React.createClass({

  getInitialState: function () {
    return JSON.parse(this.props.presenter);
  },

  handleMessageSubmit: function ( formData, action ) {
    $.ajax({
      data: formData,
      url: action,
      type: "POST",
      dataType: "json",
      success: function ( data ) {
        this.setState({ messages: data });
      }.bind(this)
    });
  },

  render: function () {
    return (
      <div className="message-box">
        <MessageList messages={ this.state.messages } />
        <MessageForm form={ this.state.form } onMessageSubmit={ this.handleMessageSubmit } current_user_id={ this.props.current_user_id }/>
      </div>
    );
  }
});
