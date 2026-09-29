<tr>
  <form method="post" action="<%PostAction%>">
    <input type="hidden" name="PlayerID" value="<%PlayerID%>">
    <td><a href="https://steamcommunity.com/profiles/<%PlayerID%>" target="_blank" rel="noopener noreferrer"><%PlayerID%></a></td>
    <td><%TextChat%></td>
    <td><%VoiceChat%></td>
    <td>
      <input class="button update" type="submit" name="Update" Value="Update">
      <input class="button delete" type="submit" name="Delete" Value="Delete">
    </td>
  </form>
</tr>
