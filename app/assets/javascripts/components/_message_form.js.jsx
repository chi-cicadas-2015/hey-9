var MessageForm = React.createClass({
  handleSubmit: function ( event ) {
    event.preventDefault();

    var content = this.refs.content.getDOMNode().value.trim();

    // validate
    if (!content) {
      return false;
    }

    // submit
    var formData = $( this.refs.form.getDOMNode() ).serialize();
    this.props.onMessageSubmit( formData, this.props.form.action );

    // reset form
    this.refs.content.getDOMNode().value = "";
  },
  render: function () {
    return (
      <form ref="form" className="message-form" action={ this.props.form.action } accept-charset="UTF-8" method="post" onSubmit={ this.handleSubmit }>
        <p><input type="hidden" name={ this.props.form.csrf_param } value={ this.props.form.csrf_token } /></p>
        <p><input type="hidden" name="current_user_id" value={this.props.current_user_id} /></p>
        <p><textarea ref="content" name="message[content]" placeholder="Message here..." /></p>
        <p><button type="submit">Post message</button></p>
      </form>
    )
  }
});
